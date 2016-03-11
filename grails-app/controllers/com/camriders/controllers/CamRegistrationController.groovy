package com.camriders.controllers

import org.apache.shiro.crypto.hash.Sha512Hash
import org.springframework.dao.DataIntegrityViolationException

import com.camriders.domains.CamRegistration
import com.camriders.domains.Tag

class CamRegistrationController {

	static allowedMethods = [save: "POST", update: "POST"]
	def baseService
	def camRegistrationService


	def create(Integer max) {
		params.max = Math.min(max ?: 9, 100)
		def camRegistrationInstanceList =  camRegistrationService.getCamRegistrationListByUser(params)
		def camRegistrationInstanceTotal =  camRegistrationService.getCamRegistrationSizeByUser()
		def userInstance = baseService.getLoggedInUser()
		[camRegistrationInstance: new CamRegistration(params), camRegistrationInstanceList : camRegistrationInstanceList, camRegistrationInstanceTotal : camRegistrationInstanceTotal, userInstance : userInstance]
	}

	def save(Integer max) {
		def tags = params.tag
		params.remove('tag')
		params.remove('tags')
		def camRegistrationInstance = new CamRegistration(params)
		def userInstance = baseService.getLoggedInUser()
		camRegistrationInstance.user = userInstance
		camRegistrationInstance.ipAddress = request.getRemoteAddr()


		if(tags instanceof String){
			camRegistrationInstance.addToTags(Tag.findByTitle(tags)?:new Tag(title:tags))
		}else{
			tags.each {
				camRegistrationInstance.addToTags(Tag.findByTitle(it)?:new Tag(title:it))
			}
		}

		params.max = Math.min(max ?: 9, 100)

		if(params?.password){
			camRegistrationInstance.password = new Sha512Hash(camRegistrationInstance.password).toHex()
		}
		if (!camRegistrationInstance.save(flush: true)) {
			def camRegistrationInstanceList =  camRegistrationService.getCamRegistrationListByUser(params)
			def camRegistrationInstanceTotal =  camRegistrationService.getCamRegistrationSizeByUser()

			render(view: "create", model: [camRegistrationInstance: camRegistrationInstance, camRegistrationInstanceList : camRegistrationInstanceList, camRegistrationInstanceTotal : camRegistrationInstanceTotal, userInstance : userInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'camRegistration.label', default: 'CamRegistration'),
			camRegistrationInstance.id
		])
		redirect(action: "create")
	}


	def delete(Long id, Integer max) {
		def camRegistrationInstance = CamRegistration.read(id)

		if (!camRegistrationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'camRegistration.label', default: 'CamRegistration'),
				id
			])
			redirect(action: "create")
			return
		}

		try {
			camRegistrationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'camRegistration.label', default: 'CamRegistration'),
				id
			])
			redirect(action: "create")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'camRegistration.label', default: 'CamRegistration'),
				id
			])
			redirect(action: "create")
		}
	}
}
