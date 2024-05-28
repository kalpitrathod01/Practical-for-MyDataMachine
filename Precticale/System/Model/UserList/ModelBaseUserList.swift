//
//  ModelModelBaseUserList.swift
//
//  Created by Kalpit Rathod on 12/05/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class ModelBaseUserList: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kModelModelBaseUserListNameKey: String = "name"
	internal let kModelModelBaseUserListAddressKey: String = "address"
	internal let kModelModelBaseUserListInternalIdentifierKey: String = "id"
	internal let kModelModelBaseUserListPhoneKey: String = "phone"
	internal let kModelModelBaseUserListCompanyKey: String = "company"
	internal let kModelModelBaseUserListWebsiteKey: String = "website"
	internal let kModelModelBaseUserListEmailKey: String = "email"
	internal let kModelModelBaseUserListUsernameKey: String = "username"


    // MARK: Properties
	public var name: String?
	public var address: ModelAddress?
	public var internalIdentifier: Int?
	public var phone: String?
	public var company: ModelCompany?
	public var website: String?
	public var email: String?
	public var username: String?



    // MARK: ObjectMapper Initalizers
    /**
        Map a JSON object to this class using ObjectMapper
        - parameter map: A mapping from ObjectMapper
    */
    required convenience init?(map: Map) {
        self.init()
    }


    /**
        Map a JSON object to this class using ObjectMapper
        - parameter map: A mapping from ObjectMapper
    */
    func mapping(map: Map) {
		name <- map[kModelModelBaseUserListNameKey]
		address <- map[kModelModelBaseUserListAddressKey]
		internalIdentifier <- map[kModelModelBaseUserListInternalIdentifierKey]
		phone <- map[kModelModelBaseUserListPhoneKey]
		company <- map[kModelModelBaseUserListCompanyKey]
		website <- map[kModelModelBaseUserListWebsiteKey]
		email <- map[kModelModelBaseUserListEmailKey]
		username <- map[kModelModelBaseUserListUsernameKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if name != nil {
			dictionary.updateValue(name! as AnyObject, forKey: kModelModelBaseUserListNameKey)
		}
		if address != nil {
			dictionary.updateValue(address!.dictionaryRepresentation() as AnyObject, forKey: kModelModelBaseUserListAddressKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier! as AnyObject, forKey: kModelModelBaseUserListInternalIdentifierKey)
		}
		if phone != nil {
			dictionary.updateValue(phone! as AnyObject, forKey: kModelModelBaseUserListPhoneKey)
		}
		if company != nil {
			dictionary.updateValue(company!.dictionaryRepresentation() as AnyObject, forKey: kModelModelBaseUserListCompanyKey)
		}
		if website != nil {
			dictionary.updateValue(website! as AnyObject, forKey: kModelModelBaseUserListWebsiteKey)
		}
		if email != nil {
			dictionary.updateValue(email! as AnyObject, forKey: kModelModelBaseUserListEmailKey)
		}
		if username != nil {
			dictionary.updateValue(username! as AnyObject, forKey: kModelModelBaseUserListUsernameKey)
		}

        return dictionary
    }

}
