//
//  ViewController.swift
//  psr_api_framework_demo
//
//  Created by Mouhamed Camara on 9/17/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import psr_api_framework

class ViewController: UIViewController
{
    @IBAction func showFullCustomPopupButtonTapped(_ sender: Any)
    {
        IFrameViewController.showCustomIFrame(vcontroller: self)
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
