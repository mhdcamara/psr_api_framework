//
//  PayDunyaOrder.swift
//  psr_api_framework
//
//  Created by Mouhamed Camara on 9/17/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation

public final class PayDunyaOrder
{
    public var total_amount: Int = 0
    public var description: String = ""
    public var items: [[String: Any]] //[Items]
    public var taxes: [[String: Any]] //[Taxes]
    
    
    public init(total_amount: Int = 0, description: String = "", items: [[String: Any]], taxes: [[String: Any]])
    {
        self.total_amount = total_amount
        self.description = description
        self.items = items
        self.taxes = taxes
    }
    
    func order()->[String: Any]
    {
        let order = [
    
            "items": self.items,
            "taxes": self.taxes,
            "total_amount": self.total_amount,
            "channels": ["card"],
            "description": self.description
            ] as [String : Any]
    
        return order
    }
}


public class Items
{
    public let name: String
    public let quantity: Int
    public let unit_price: String
    public let total_price: String
    public let description: String
    
    public init(name: String, quantity: Int, unit_price: String, total_price: String, description: String)
    {
        self.name = name
        self.quantity = quantity
        self.unit_price = unit_price
        self.total_price = total_price
        self.description = description
    }
}

public class Taxes
{
    public let name: String
    public let amount: Int
    
    public init(name: String, amount: Int)
    {
        self.name = name
        self.amount = amount
    }
}
