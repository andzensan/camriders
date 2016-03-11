package com.camriders.controllers

import com.camriders.domains.CamRegistration
import com.camriders.domains.Tag


class StreamController {

	def baseService


	def list(){
		if(params.selected&&(params.selected!="")){
			List selected = []
			params.selected.split(" ").each {
				selected<<Tag.get(it.toInteger())
			}

			def streams = [] as Set
			selected.each{
				def tagId = it.id
				CamRegistration.withCriteria {
					tags {
						eq('id', tagId as Long)
					}
				}.each {streams<<it}
			}
			render template:"/streams", model:[streams:streams]
			return
		}
		else{
			render template:"/streams"
		}
	}

	def view(Long id) {
		def camRegistrationInstance = CamRegistration.get(id)
		camRegistrationInstance.user=  baseService.getLoggedInUser()
		[camRegistrationInstance: camRegistrationInstance]
	}
}
