package com.camriders.services

import grails.gsp.PageRenderer

import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.codehaus.groovy.grails.web.mapping.LinkGenerator;
class EmailNotificationService {

	boolean transactional = false
	def mailService
	def emailConfirmationService
	PageRenderer groovyPageRenderer
	def grailsApplication
	LinkGenerator grailsLinkGenerator
	
	
	def sendRegistrationConfirmationEmail(def userInstance){
		mailService.sendMail {
			to userInstance?.username?.trim()
			from "camridersportal@gmail.com"
			subject "Welcome to Camrider - Confirmation Mail"
			html groovyPageRenderer.render(template : "/emailTemplates/signupEmailConfirmation", model:[userInstance:userInstance, confirmationURL :grailsApplication?.config?.grails.serverURL])
		}
		
		println "Confirmation Mail Sent."
	}
	
	/*def makeURL() {
		def grailsApplication = ApplicationHolder.application
		def serverURL = grailsLinkGenerator.serverBaseURL//grailsApplication.config.grails.serverURL ?: 'http://localhost:8080/'+grailsApplication.metadata.'app.name'
		return "${serverURL}"
	}*/
    def sendResetPasswordConfirmationEmail(def userInstance,def password){
        String confirmationURL =  makeURL(userInstance?.emailUUID)
         mailService.sendMail {
            to userInstance?.username?.trim()
            from "camridersportal@gmail.com"
            subject "Your password have changed."
            html "Now you can use password:"+password
        }

        println "Resend password have successfully sent."
    }

}
