//
//  StoreConstant.swift
//  psr_api_framework
//
//  Created by Mouhamed Camara on 9/17/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation

public final class StoreConstant
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
}
