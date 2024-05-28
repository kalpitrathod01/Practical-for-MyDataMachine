//
//  ModelAddress.swift
//
//  Created by Kalpit Rathod on 12/05/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class ModelAddress: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kModelAddressCityKey: String = "city"
	internal let kModelAddressSuiteKey: String = "suite"
	internal let kModelAddressGeoKey: String = "geo"
	internal let kModelAddressStreetKey: String = "street"
	internal let kModelAddressZipcodeKey: String = "zipcode"


    // MARK: Properties
	public var city: String?
	public var suite: String?
	public var geo: ModelGeo?
	public var street: String?
	public var zipcode: String?



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
		city <- map[kModelAddressCityKey]
		suite <- map[kModelAddressSuiteKey]
		geo <- map[kModelAddressGeoKey]
		street <- map[kModelAddressStreetKey]
		zipcode <- map[kModelAddressZipcodeKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if city != nil {
			dictionary.updateValue(city! as AnyObject, forKey: kModelAddressCityKey)
		}
		if suite != nil {
			dictionary.updateValue(suite! as AnyObject, forKey: kModelAddressSuiteKey)
		}
		if geo != nil {
			dictionary.updateValue(geo!.dictionaryRepresentation() as AnyObject, forKey: kModelAddressGeoKey)
		}
		if street != nil {
			dictionary.updateValue(street! as AnyObject, forKey: kModelAddressStreetKey)
		}
		if zipcode != nil {
			dictionary.updateValue(zipcode! as AnyObject, forKey: kModelAddressZipcodeKey)
		}

        return dictionary
    }

}
