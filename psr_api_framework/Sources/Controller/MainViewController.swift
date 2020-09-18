////
////  MainViewController.swift
////  psr_api
////
////  Created by Mouhamed Camara on 7/6/20.
////  Copyright © 2020 PayDunya. All rights reserved.
////
//
//import UIKit
//import SwiftyJSON
//import Alamofire
//import EzPopup
//
//
//public class MainViewController: UIViewController
//{
//
//    let VC = IFrameViewController.instantiate()
//
//
//    @IBAction func showFullCustomPopupButtonTapped(_ sender: Any)
//    {
//        guard let pickerVC = VC else { return }
//        let popupVC = PopupViewController(contentController: pickerVC, position: .top(50), popupWidth: view.frame.width - 20, popupHeight: self.view.frame.height - 70)
//        popupVC.backgroundAlpha = 0.3
//        popupVC.backgroundColor = .black
//        popupVC.canTapOutsideToDismiss = true
//        popupVC.cornerRadius = 10
//        popupVC.shadowEnabled = true
//        present(popupVC, animated: true, completion: nil)
//
//        CheckoutInvoice()
//
//
////        pickerVC.delegate = self
//
//
//
//    }
//
//
//    public override func viewDidLoad()
//    {
//        super.viewDidLoad()
//    }
//
//    //MARK: Privates Function
//
//    private func CheckoutInvoice()
//    {
//        let Store = PaydunyaStore(
//             name: "paydunyaIOS-Plugin",
//             tagline: "L'élégance c'est nous!",
//             postal_address: "11500",
//             phone: 778064927,
//             logo_url: "",
//             website_url: ""
//         )
//        let item1 = Items(
//            name: "Chaussures Croco",
//            quantity: 3,
//            unit_price: "10000",
//            total_price: "30000",
//            description: "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
//        )
//
//        let item2 = Items(
//           name: "Chaussures Python",
//           quantity: 2,
//           unit_price: "10000",
//           total_price: "30000",
//           description: "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
//        )
//
//        let tax1 = Taxes(
//            name: "TVA (18%)",
//            amount: 12
//        )
//
//        let tax2 = Taxes(
//           name: "TVA (18%)",
//           amount: 15
//        )
//
//         let Order = PayDunyaOrder(
//            total_amount: 200,
//            description: "Chaussures Croco et Python",
//            items: [item1, item2],
//            taxes: [tax1, tax2]
//         )
//
//         //Initialisation des Clé d'API
//        let Setup = PaydunyaSetup(
//             master_key: "9iQ6hGxZ-Ln51-3TH5-rJ8w-Ywj7ofR1umMW",
//             private_key: "live_private_p2Sfz3iXvVkvQXqr8tNLBL5s5Pr",
//             token: "qkiNmADLj8fiFarnVqVd",
//             cancel_url: "",
//             return_url:  "",
//             callback_url: ""
//        )
//
//        checkoutInvoice(store: Store, setup: Setup, order: Order)
//    }
//}
