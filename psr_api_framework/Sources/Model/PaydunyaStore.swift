//
//  PaydunyaStore.swift
//  PayDunya
//
//  Created by PayDunya on 7/22/19.
//  Copyright © 2019 PayDunya. All rights reserved.
//

import Foundation
import Alamofire


public final class PaydunyaStore
{
    public let name: String
    public let tagline: String
    public let postal_address: String
    public let phone: Int
    public let logo_url: String
    public let website_url: String
    
    
    public init(name: String, tagline: String, postal_address: String, phone: Int, logo_url: String,  website_url: String)
    {
        self.name = name
        self.tagline = tagline
        self.postal_address = postal_address
        self.phone = phone
        self.logo_url = logo_url
        self.website_url = website_url
        
    }
    
    func store()->[String: Any]
    {
       
        let Parameters = [
           
            "store": [
                "name": self.name,
                "tagline": self.tagline,
                "postal_address": self.postal_address ,
                "phone": self.phone ,
                "logo_url": self.logo_url,
                "website_url": self.website_url
            ]
        ]
        
        return Parameters["store"]!
    }
}
