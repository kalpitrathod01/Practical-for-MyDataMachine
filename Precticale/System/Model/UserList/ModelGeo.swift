//
//  ModelGeo.swift
//
//  Created by Kalpit Rathod on 12/05/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class ModelGeo: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kModelGeoLatKey: String = "lat"
	internal let kModelGeoLngKey: String = "lng"


    // MARK: Properties
	public var lat: String?
	public var lng: String?



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
		lat <- map[kModelGeoLatKey]
		lng <- map[kModelGeoLngKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if lat != nil {
			dictionary.updateValue(lat! as AnyObject, forKey: kModelGeoLatKey)
		}
		if lng != nil {
			dictionary.updateValue(lng! as AnyObject, forKey: kModelGeoLngKey)
		}

        return dictionary
    }

}
