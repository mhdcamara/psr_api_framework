//
//  Free.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/16/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



extension Senegal: FreeMoneyDelegate
{
    func paymentWithFM(tel: String)
    {
        let token = AppConstant.invoice_token
        let name = AppConstant.fullname
        print("Voici est données de connexion pour Free: \(tel)")
        
        FreeMoneyRequest(tel: tel, name: name, token: token)
    }
    
    
    //MARK: Private Function
    
    
    private func FreeMoneyRequest(tel: String, name: String, token: String)
    {
        customActivityIndicatory(theIframe.view, startAnimate: true)

        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        let params: Parameters = [
            "customer_fullname": name,
            "customer_email":"doro.gueye@paydunya.com",
            "customer_address" : "somewhere",
            "phone_number": tel,
            "payment_token": token
        ]
        
        
        Alamofire.request("https://app.paydunya.com/api/v1/softpay/free-money-senegal", method: .post ,parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON
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
                        let message = json["message"].stringValue
                        customActivityIndicatory(theIframe.view, startAnimate: false)
                        self.successAlert(message: message)
                    }
                    else
                    {
                        customActivityIndicatory(theIframe.view, startAnimate: false)

                        let message = json["message"].stringValue
                        self.WizAll_Initiate_Error_Alert(message: message)
                    }
                    print("Voici la réponse pour PayDunya: \(json)")
                
                case let .failure(error):
                    customActivityIndicatory(theIframe.view, startAnimate: false)
                    print(error)
            }
         
        }
    }
}
