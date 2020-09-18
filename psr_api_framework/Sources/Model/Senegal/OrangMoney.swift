//
//  OrangeMoney.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/16/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



extension Senegal: OMoneyDelegate
{
    func paymentWithOM(tel: String, code: String)
    {
        let token = AppConstant.invoice_token
        print("Voici est données de connexion pour OM: \(tel) et \(code)")
        
        OMoneyRequest(tel: tel, code: code, token: token)
        
    }
    
    
    //MARK: Private Function
    
    
    private func OMoneyRequest(tel: String, code: String, token: String)
    {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        let params: Parameters = [
            "customer_name": "Palouki",
            "customer_email": "chr2@gmail.com",
            "phone_number": tel,
            "authorization_code": code,
            "invoice_token": token
        ]
        
        
        Alamofire.request("https://app.paydunya.com/api/v1/softpay/orange-money-senegal", method: .post ,parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON
        {
            response in
            print("ResultJSON: \(response.result)")    // On affiche la réponse en JSON
            
            
            // On regarde la réponse renvoyée par la requete
            switch response.result
            {
                case let .success(value): // En cas de Succes de la requete
                    
                    let json = JSON(value)
                    
                    if json["success"].boolValue
                    {
                        self.successAlert()
                    }
                    else
                    {
//                        self.cancelAlert()
                        self.WizAll_Confirmed_Error_Alert()
                    }
                    print("Voici la réponse pour PayDunya: \(json)")
                
                case let .failure(error): print(error)
            }
         
        }
    }
}
