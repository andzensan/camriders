package com.camriders.services

import org.springframework.transaction.annotation.Transactional

import com.camriders.domains.CamRegistration
import com.sun.org.apache.bcel.internal.generic.RETURN;

class CamRegistrationService {

	def baseService
	
	@Transactional(readOnly = true)
    def getCamRegistrationListByUser(params){
		def camList = CamRegistration.findAllByUser(baseService.getLoggedInUser(), [max: params?.max?:9, offset: params?.offset?:0])
		return camList ?: []
	}
	
	@Transactional(readOnly = true)
	def getCamRegistrationSizeByUser(params){
		def camListSize = CamRegistration.findAllByUser(baseService.getLoggedInUser())?.size()
		return camListSize ?: 0
	}
}
