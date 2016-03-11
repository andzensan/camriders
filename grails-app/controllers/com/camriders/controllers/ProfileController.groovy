package com.camriders.controllers

import com.camriders.domains.History
import org.apache.shiro.crypto.hash.Sha512Hash

import com.camriders.domains.User

class ProfileController {

	def baseService
    def index() {
		[userInstance : baseService.getLoggedInUser()]
	}
	
	def updateProfile(){
		def userInstance = User.read(params?.userId)
		def dbPassword = userInstance.passwordHash
		
		if(params?.dob){
			params?.dob = java.util.Date.parse("MM/dd/yyyy", params?.dob)
		}
		userInstance.properties = params
	
		if(params?.passwordHash){
			if(!dbPassword.equals(params?.passwordHash)){
				userInstance.passwordHash = new Sha512Hash(params?.passwordHash).toHex()
			}
		}
		
		userInstance.errors.each {
			println it
		}
		if(userInstance.validate()){
			userInstance.save(flush:true)
			flash.message = "Record saved successfully."
		}
		redirect(action : "index")
	}
    def activityLog={
        Integer max
        params.max = Math.min(max ?: 10, 100)
		params?.sort = "createdDate"
		params.order = "desc"
        render(view: 'activity_log',model: [historyInstanceList: History.list(params), historyInstanceTotal: History.count()])
    }

}
