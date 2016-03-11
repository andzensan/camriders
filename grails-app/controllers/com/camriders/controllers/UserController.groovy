package com.camriders.controllers

import com.camriders.domains.CamRegistration;
import com.camriders.domains.History

import org.apache.shiro.crypto.hash.Sha512Hash

import com.camriders.domains.User

class UserController {

	def baseService
    def userList(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		params.order = params?.order?:"desc"
		params?.sort = params?.sort?:"dateCreated"
		[usersList : User.list(params), usersListSize : User.count()]
	}
	
	def streamList(Integer max){
		params.max = Math.min(max ?: 10, 100)
		params.order = params?.order?:"desc"
		params?.sort = params?.sort?:"dateCreated"
		[streamList : CamRegistration.list(params), streamListSize : CamRegistration.count()]
	}
	
	def deleteStream(){
		def camRegistrationInstance = CamRegistration.read(params?.id)
		camRegistrationInstance.delete(flush:true)
		flash.message = "Record deleted successfully."
		
		redirect(action : "streamList")
	}
	

}
