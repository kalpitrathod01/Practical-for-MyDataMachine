//
//  ModelCompany.swift
//
//  Created by Kalpit Rathod on 12/05/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class ModelCompany: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kModelCompanyCatchPhraseKey: String = "catchPhrase"
	internal let kModelCompanyNameKey: String = "name"
	internal let kModelCompanyBsKey: String = "bs"


    // MARK: Properties
	public var catchPhrase: String?
	public var name: String?
	public var bs: String?



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
		catchPhrase <- map[kModelCompanyCatchPhraseKey]
		name <- map[kModelCompanyNameKey]
		bs <- map[kModelCompanyBsKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if catchPhrase != nil {
			dictionary.updateValue(catchPhrase! as AnyObject, forKey: kModelCompanyCatchPhraseKey)
		}
		if name != nil {
			dictionary.updateValue(name! as AnyObject, forKey: kModelCompanyNameKey)
		}
		if bs != nil {
			dictionary.updateValue(bs! as AnyObject, forKey: kModelCompanyBsKey)
		}

        return dictionary
    }

}
