package com.camriders.controllers

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.grails.ConfigUtils
import org.apache.shiro.web.util.SavedRequest
import org.apache.shiro.web.util.WebUtils

import com.camriders.domains.History
import com.camriders.domains.Role
import com.camriders.domains.User
import com.camriders.services.ActivityName
import com.camriders.services.RandomStringGenerator

class AuthController {
    def shiroSecurityManager
	def userService
    def emailNotificationService

    def index = { redirect(action: "login", params: params) }

    def login = {
        return [ username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
    }
	
	def register = {
		
	}
	
	def createUser(){
		def userInstance = new User()
		userInstance.username = params?.username
		userInstance.firstName = params?.firstName
		userInstance.lastName = params?.lastName
		userInstance.gender = params?.gender
		userInstance.passwordHash = params?.passwordHash
		userInstance.ipAddress = request.getRemoteAddr()
		if(params?.dob){
			userInstance.dob = java.util.Date.parse("MM/dd/yyyy", params?.dob)
		}
		def roleInstance = Role.findByName("User")
		
		println "roleInstance :" + roleInstance.name
		
		userInstance.addToRoles(roleInstance)
		//userInstance.enabled = false
		if (!userInstance.validate()) {
			render(view: "register", model: [userInstance: userInstance])
			return
		}else{
			userInstance.passwordHash = new Sha512Hash(userInstance.passwordHash).toHex()
			def user = userService.createUser(userInstance)
			def authToken = new UsernamePasswordToken(params.username, params.passwordHash)
			SecurityUtils.subject.login(authToken)
		}

		//flash.message = message(code: 'default.created.message')
		redirect(action: "create", controller:"camRegistration")
	}

    def signIn = {
        def authToken = new UsernamePasswordToken(params.username, params.password as String)
        // Support for "remember me"
        if (params.rememberMe) {
            authToken.rememberMe = true
        }
        
        // If a controller redirected to this page, redirect back
        // to it. Otherwise redirect to the root URI.
        def targetUri = params.targetUri ?: "/"
        
        // Handle requests saved by Shiro filters.
        SavedRequest savedRequest = WebUtils.getSavedRequest(request)
        if (savedRequest) {
            targetUri = savedRequest.requestURI - request.contextPath
            if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
        }
        
        try{
            // Perform the actual login. An AuthenticationException
            // will be thrown if the username is unrecognised or the
            // password is incorrect.
            SecurityUtils.subject.login(authToken)
			
			//Update lastLogin date/time
			def user = User.findByUsername(params?.username)
			user.lastLoginDate = new Date()
			user.save(flush:true)
			
            log.info "Redirecting to '${targetUri}'."
            activityLogForLoggedIn(params.username)
            redirect(uri: targetUri)
        }
        catch (AuthenticationException ex){
            // Authentication failed, so display the appropriate message
            // on the login page.
            log.info "Authentication failure for user '${params.username}'."
            flash.message = message(code: "login.failed")

            // Keep the username and "remember me" setting so that the
            // user doesn't have to enter them again.
            def m = [ username: params.username ]
            if (params.rememberMe) {
                m["rememberMe"] = true
            }

            // Remember the target URI too.
            if (params.targetUri) {
                m["targetUri"] = params.targetUri
            }

            // Now redirect back to the login page.
            redirect(action: "login", params: m)
        }
    }

    def signOut = {
        // Log the user out of the application.
        def principal = SecurityUtils.subject?.principal
        SecurityUtils.subject?.logout()
        // For now, redirect back to the home page.
        if (ConfigUtils.getCasEnable() && ConfigUtils.isFromCas(principal)) {
            println("OUT##")
            redirect(uri:ConfigUtils.getLogoutUrl())
        }else {
            activityLogForLogOut(principal)
            redirect(uri: "/")
        }
        ConfigUtils.removePrincipal(principal)
    }

    def unauthorized = {
        render "You do not have permission to access this page."
    }
    def forgotPassword={
        println("FOROGOT PASSWORD");
    }
    def resetPasswordSendToEmail(){

         def user=User.findByUsername(params.email)

        if(user==null){
            flash.message = message(code: 'default.invalidEmailID')
            render(view: "forgotPassword")
            return
         }else{
             RandomStringGenerator ra=new RandomStringGenerator()
            def userInstance=User.get(user.id)
            //userInstance.passwordHash = new Sha512Hash(ra.generateRandomString()).toHex()
            def pass= ra.generateRandomString()
            def passwordHash = new Sha512Hash(pass).toHex()

            emailNotificationService.sendResetPasswordConfirmationEmail(user,pass)
            userInstance.passwordHash=passwordHash

            userInstance.save()
            flash.message = message(code: 'default.passwordChanged')
         }


        redirect(action: "login")
    }
    def activityLogForLoggedIn(def username){
        def history=new History()
        history.comment="User with "+username+" have loggedIn."
        history.createdDate=new Date()
        history.userAction=ActivityName.LOGGEDIN
        history.save()

    }
    def activityLogForLogOut(def username){
        def history=new History()
        history.comment="User with "+username+" have logged out."
        history.createdDate=new Date()
        history.userAction=ActivityName.LOGGEDOUT
        history.save()

    }
}
