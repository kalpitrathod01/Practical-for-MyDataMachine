//
//  ModelModelBaseViewPost.swift
//
//  Created by Kalpit Rathod on 12/05/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class ModelBaseViewPost: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kModelModelBaseViewPostTitleKey: String = "title"
	internal let kModelModelBaseViewPostUserIdKey: String = "userId"
	internal let kModelModelBaseViewPostInternalIdentifierKey: String = "id"
	internal let kModelModelBaseViewPostBodyKey: String = "body"


    // MARK: Properties
	public var title: String?
	public var userId: Int?
	public var internalIdentifier: Int?
	public var body: String?



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
		title <- map[kModelModelBaseViewPostTitleKey]
		userId <- map[kModelModelBaseViewPostUserIdKey]
		internalIdentifier <- map[kModelModelBaseViewPostInternalIdentifierKey]
		body <- map[kModelModelBaseViewPostBodyKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title! as AnyObject, forKey: kModelModelBaseViewPostTitleKey)
		}
		if userId != nil {
			dictionary.updateValue(userId! as AnyObject, forKey: kModelModelBaseViewPostUserIdKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier! as AnyObject, forKey: kModelModelBaseViewPostInternalIdentifierKey)
		}
		if body != nil {
			dictionary.updateValue(body! as AnyObject, forKey: kModelModelBaseViewPostBodyKey)
		}

        return dictionary
    }

}
