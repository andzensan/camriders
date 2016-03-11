package com.camriders.domains

class CamRegistration {

	String camURL
	String name
	String username
	String password
	Date dateCreated
	Date lastUpdated
	Boolean status = true
    String modelIpCam
	String wowzaURL
	
	String ipAddress
	
	static belongsTo = [user : User]
	static hasMany = [tags : Tag]
    static constraints = {
		camURL(size:0..2100, nullable:false, blank : false)
		wowzaURL(size:0..2100, nullable:true, blank : true)
		username blank : true, nullable : true, maxSize : 100
		password blank : true, nullable : true, maxSize: 150
        modelIpCam(maxSize: 250, nullable:false, blank : false)
        name(maxSize: 250, nullable:true, blank : true)
		ipAddress(nullable: true, blank: true)
    }

}
