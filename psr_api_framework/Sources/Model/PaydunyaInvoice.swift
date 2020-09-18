//
//  PaydunyaInvoice.swift
//  PayDunya
//
//  Created by PayDunya on 7/24/19.
//  Copyright © 2019 PayDunya. All rights reserved.
//

import Foundation
import Alamofire

public final class PaydunyaInvoice
{
    public let store: PaydunyaStore!
    public let setup: PaydunyaSetup!
    public let order: PayDunyaOrder!
    
    
    public init(store: PaydunyaStore, setup: PaydunyaSetup, order: PayDunyaOrder)
    {
        self.store =  store
        self.setup = setup
        self.order = order
    }
    
    func Invoice()-> Parameters
    {
        var invoice: Parameters = [
            "invoice": [
               
            ],
            
            "store": [
            ],
            
            "custom_data": [
            ],

            "actions": [
                
            ]
        ]
        
        invoice["invoice"] = self.order.order()
        invoice["store"] = self.store.store()
        invoice["actions"] = self.setup.actions()
        
        return invoice
    }
}
