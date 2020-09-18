//
//  PayDunyaContant.swift
//  psr_api_framework
//
//  Created by Mouhamed Camara on 9/17/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation

public final class PayDunyaContant
{
    public let master_key: String
    public let private_key: String
    public var token: String
    
    public let cancel_url: String
    public let return_url: String
    public let callback_url: String
    
//    static public var payment_url = ""
//    public var invoice_token: String

    
    public init(master_key: String, private_key: String, token: String, cancel_url: String, return_url: String, callback_url: String)
    {
        self.master_key = master_key
        self.private_key = private_key
        self.token = token
        self.cancel_url = cancel_url
        self.return_url = return_url
        self.callback_url = callback_url
    }
}
