//
//  CheckoutInvoice.swift
//  psr_api_framework
//
//  Created by Mouhamed Camara on 9/18/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


public func checkoutInvoice(store: PaydunyaStore, setup: PaydunyaSetup, order: PayDunyaOrder)
{
    let invoice = PaydunyaInvoice(store: store, setup: setup, order: order)

    let Headers: HTTPHeaders = setup.setup()

    let Parametres: Parameters = invoice.Invoice()

     // La requete avec Alamofire

     Alamofire.request("https://app.paydunya.com/api/v1/checkout-invoice/create", method: .post ,parameters: Parametres, encoding: JSONEncoding.default, headers: Headers).responseJSON
     {
         response in
         print("ResultJSON: \(response.result)")    // On affiche la réponse en JSON


         // On regarde la réponse renvoyée par la requete
         switch response.result
         {
             case let .success(value): // En cas de Succes de la requete

                 let json = JSON(value)

                 print("Voici la réponse: \(json)")

                 let urlpaiement = json["response_text"].stringValue

                 AppConstant.payment_url = urlpaiement

                 //On redirige l'utilisateur vers la page de paiement

                 let token = json["token"].stringValue

                 print("Le token: \(token)")
                 print("L'url: \(urlpaiement)")

                 AppConstant.invoice_token = token

             case let .failure(error): print(error)
         }

     }
}
