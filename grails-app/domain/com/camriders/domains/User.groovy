package com.camriders.domains

class User {
    String username
    String passwordHash
	String firstName
	String lastName
	Date dateCreated
	Date lastUpdated
	Date confimationMailSentDate = new Date()
	String emailUUID
	boolean isVerified = false
	
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false

	String ipAddress
	String gender
	Date dob
	String zipCode
	String phoneNumber
	Date lastLoginDate = new Date()
	
    static hasMany = [ roles: Role, permissions: String ]
	
	static mapping = {
		permissions fetch:'join'
	}

    static constraints = {
        username(nullable: false, blank: false, unique: true, email : true)
		passwordHash(nullable: false, blank: false)
		firstName(nullable: false, blank: false)
		lastName(nullable: false, blank: false)
		emailUUID(nullable: true, blank: true)
		ipAddress(nullable: true, blank: true)
		gender(nullable: false, blank: false)
		dob(nullable: false, blank: false)
		zipCode(nullable: true, blank: true)
		phoneNumber(nullable: true, blank: true)
		lastLoginDate(nullable: true, blank: true)
    }
}
