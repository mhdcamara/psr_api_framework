//
//  paydunyaSetup.swift
//  PayDunya
//
//  Created by PayDunya on 7/19/19.
//  Copyright © 2019 PayDunya. All rights reserved.
//

import Foundation
import Alamofire


public final class PaydunyaSetup
{
    public let master_key: String
    public let private_key: String
    public var token: String
    
    public let cancel_url: String
    public let return_url: String
    public let callback_url: String

    
    public init(master_key: String, private_key: String, token: String, cancel_url: String, return_url: String, callback_url: String)
    {
        self.master_key = master_key
        self.private_key = private_key
        self.token = token
        self.cancel_url = cancel_url
        self.return_url = return_url
        self.callback_url = callback_url
    }
    
    
    func actions()->[String: Any]
    {
        let actions: [String: Any] = [
            "cancel_url": self.cancel_url,
            "return_url": self.return_url,
            "callback_url": self.callback_url
        ]
        return actions
    }
    
    
    func setup()->HTTPHeaders
    {
        let Headers: HTTPHeaders = [
            "User-Agent": "paydunya-ios/v1.0",
            "Content-Type": "application/json",
            "PAYDUNYA-MASTER-KEY": self.master_key,
            "PAYDUNYA-PRIVATE-KEY": self.private_key,
            "PAYDUNYA-TOKEN": self.token,
            
        ]
        return Headers
    }
}
