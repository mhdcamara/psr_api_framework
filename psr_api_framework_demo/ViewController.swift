//
//  ViewController.swift
//  psr_api_framework_demo
//
//  Created by Mouhamed Camara on 9/17/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import EzPopup
import psr_api_framework

class ViewController: UIViewController
{
    
//    let storyboardName = "StoryboardName"
//    let storyboardBundle = Bundle(for: IFrameViewController.self)
//    let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    
    
    
    //IFrameViewController.instantiate()
    
    @IBAction func showFullCustomPopupButtonTapped(_ sender: Any)
    {
        let frameworkBundle = Bundle(identifier: "com.paydunya.psr-api-framework")
        
        let VC = UIStoryboard(name: "PayDunyaPSR", bundle: frameworkBundle).instantiateViewController(withIdentifier: "\(IFrameViewController.self)") as? IFrameViewController
        
          guard let pickerVC = VC else { return }
          let popupVC = PopupViewController(contentController: pickerVC, position: .top(50), popupWidth: view.frame.width - 20, popupHeight: self.view.frame.height - 70)
          popupVC.backgroundAlpha = 0.3
          popupVC.backgroundColor = .black
          popupVC.canTapOutsideToDismiss = true
          popupVC.cornerRadius = 10
          popupVC.shadowEnabled = true
          present(popupVC, animated: true, completion: nil)

          CheckoutInvoice()
    }
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        let maths = Maths(a: 5, b: 7)
                
        print("Add: \(maths.add())")
        print("Add: \(maths.sub())")
        
    }
    
    //MARK: Privates Function

    private func CheckoutInvoice()
    {
        let Store = PaydunyaStore(
             name: "paydunyaIOS-Plugin",
             tagline: "L'élégance c'est nous!",
             postal_address: "11500",
             phone: 778064927,
             logo_url: "",
             website_url: ""
         )
        
        
        let item1 = [
            "name": "Chaussures Croco",
            "quantity": 3,
            "unit_price": "10000",
            "total_price": "30000",
            "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
            ] as [String : Any]
        
        let item2 = [
            "name": "Chaussures Python",
            "quantity": 2,
            "unit_price": "10000",
            "total_price": "30000",
            "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
        ] as [String : Any]
        
        let tax1 = [
            "name": "TVA (18%)",
            "amount": 12
        ] as [String : Any]
        
        let tax2 = [
            "name": "TVA (18%)",
            "amount": 2
        ] as [String : Any]
        
//        let item1 = Items(
//            name: "Chaussures Croco",
//            quantity: 3,
//            unit_price: "10000",
//            total_price: "30000",
//            description: "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
//        )
        
//        let item2 = Items(
//           name: "Chaussures Python",
//           quantity: 2,
//           unit_price: "10000",
//           total_price: "30000",
//           description: "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
//        )

//        let tax1 = Taxes(
//            name: "TVA (18%)",
//            amount: 12
//        )
//
//        let tax2 = Taxes(
//           name: "TVA (18%)",
//           amount: 15
//        )
        
         let Order = PayDunyaOrder(
            total_amount: 200,
            description: "Chaussures Croco et Python",
            items: [item1, item2],
            taxes: [tax1, tax2]
         )

         //Initialisation des Clé d'API
        let Setup = PaydunyaSetup(
             master_key: "9iQ6hGxZ-Ln51-3TH5-rJ8w-Ywj7ofR1umMW",
             private_key: "live_private_p2Sfz3iXvVkvQXqr8tNLBL5s5Pr",
             token: "qkiNmADLj8fiFarnVqVd",
             cancel_url: "",
             return_url:  "",
             callback_url: ""
        )

        checkoutInvoice(store: Store, setup: Setup, order: Order)
    }

}
//
//import UIKit
//import SwiftyJSON
//import Alamofire
//import EzPopup
//
//
//class MainViewController: UIViewController
//{
//
//
//
//    let VC = ViewController.instantiate()
//
//    @IBAction func showFullCustomPopupButtonTapped(_ sender: Any) {
//        guard let pickerVC = VC else { return }
//
////        pickerVC.delegate = self
//
//
//        let popupVC = PopupViewController(contentController: pickerVC, position: .top(50), popupWidth: self.view.frame.width - 20, popupHeight: self.view.frame.height - 70)
//        popupVC.backgroundAlpha = 0.3
//        popupVC.backgroundColor = .black
//        popupVC.canTapOutsideToDismiss = true
//        popupVC.cornerRadius = 10
//        popupVC.shadowEnabled = true
//        present(popupVC, animated: true, completion: nil)
//
//        CheckoutInvoice()
//    }
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//    }
//
//    //MARK: Privates Function
//
//    private func CheckoutInvoice()
//    {
//        /*
//          *   Préparation de la requete
//          */
//
//
//         // Initialisation des paramétres de la requete
//        let Store = PaydunyaStore(
//             name: "paydunyaIOS-Plugin",
//             tagline: "L'élégance c'est nous!",
//             postal_address: "11500",
//             phone: 778064927,
//             logo_url: "",
//             website_url: ""
//         )
//
//         Store.total_amount = 200
//         Store.description = "Chaussures Croco"
//
//         Store.items = [
//                 "name": "Chaussures Croco",
//                 "quantity": 3,
//                 "unit_price": "10000",
//                 "total_price": "30000",
//                 "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
//         ]
//
//         Store.taxes = [
//                 "name": "TVA (18%)",
//                 "amount": 12
//         ]
//
//         //Initialisation des Clé d'API
//         let Setup = PaydunyaSetup(
//            MasterKey: AppConstant.master_key,
//            PrivateKey: AppConstant.private_key,
//            Token: AppConstant.token,
//            cancel_url: AppConstant.cancel_url,
//            return_url:  AppConstant.return_url,
//            callback_url: AppConstant.callback_url
//         )
//
//         let invoice = PaydunyaInvoice()
//
//         let Headers: HTTPHeaders = Setup.setup()
//
//         let Parametres: Parameters = invoice.Invoice(store: Store, setup: Setup)
//
//         // La requete avec Alamofire
//
//         Alamofire.request("https://app.paydunya.com/api/v1/checkout-invoice/create", method: .post ,parameters: Parametres, encoding: JSONEncoding.default, headers: Headers).responseJSON
//         {
//             response in
//             print("ResultJSON: \(response.result)")    // On affiche la réponse en JSON
//
//
//             // On regarde la réponse renvoyée par la requete
//             switch response.result
//             {
//                 case let .success(value): // En cas de Succes de la requete
//
//                     let json = JSON(value)
//
//                     print("Voici la réponse: \(json)")
//
//                     let urlpaiement = json["response_text"].stringValue
//
//                     AppConstant.payment_url = urlpaiement
//
//                     //On redirige l'utilisateur vers la page de paiement
//
//                     let token = json["token"].stringValue
//
//                     print("Le token: \(token)")
//                     print("L'url: \(urlpaiement)")
//
//                     AppConstant.invoice_token = token
//
//                 case let .failure(error): print(error)
//             }
//
//         }
//    }
//}
//
