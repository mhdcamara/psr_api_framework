//
//  Maths.swift
//  psr_api_framework
//
//  Created by Mouhamed Camara on 9/17/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation



public final class Maths
{
    let name = "Maths"
    let a: Int
    let b: Int
    
    public init(a: Int, b: Int)
    {
        self.a = a
        self.b = b
    }
    
    public func add() -> Int {
        return self.a + self.b
    }
    
    public func sub() -> Int {
        return self.a - self.b
    }
}
