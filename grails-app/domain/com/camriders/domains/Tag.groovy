package com.camriders.domains

class Tag {

	String title
	static hasMany = [camRegistrations : CamRegistration]
	static belongsTo = CamRegistration
    static constraints = {
		title nullable:false, blank: false, unique: true
		
    }
}
