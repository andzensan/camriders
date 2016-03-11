package com.camriders.services

import org.apache.shiro.SecurityUtils
import org.springframework.transaction.annotation.Transactional

import com.camriders.domains.User

class BaseService {

	@Transactional(readOnly = true)
	def getLoggedInUser(){
		def userInstance = User.findByUsername(SecurityUtils.subject?.principal)
		return userInstance
	}
}
