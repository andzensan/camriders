package com.camriders.controllers

import com.camriders.domains.User;

class ConfirmController {

	def baseService
	def userService
    def index() { 
		def userInstance = User.findByEmailUUIDAndIsVerified(params?.id, false) 
		if(!userInstance){
			redirect(action:"emailNotVerified")
			return
		}
		userInstance.isVerified = true
		userInstance.save(flush:true)
		
		redirect(action:"emailVerified")
	}
	
	def emailVerified(){
		
	}
	def emailNotVerified(){
		
	}
	def resendVerificationMessage(){
		
	}
	def resendVerificationEmail(){
		println "Going to resend verfication email."
		def userInstance = baseService.getLoggedInUser()
		//Resend verification email to user with new emailUUID and update userInstance accordingly
		userService.createUser(userInstance)
		redirect(action:"resendVerificationMessage")
	}
	
	def successMessageAfterConfirmation(){
	}
	
}
