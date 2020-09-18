//
//  WizAllMoney.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/16/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



extension Senegal: WizAllDelegate
{
//    func paymentWithWizAll(tel: String) {
//
//    }
    
    func paymentWithWizAll(tel: String, phoneTextField: UITextField, codeTextField: UITextField, initBnt: UIButton, confirmedBnt: UIButton)
    {
        
        let token = AppConstant.invoice_token
        
        print("Voici est données de connexion pour WizAll 1: \(token)")
        
        wizall_initiate(token: token, tel: tel, phoneTextField: phoneTextField, codeTextField: codeTextField, initBnt: initBnt, confirmedBnt: confirmedBnt)
    }
    
//    func paymentWithWizAll(tel: String, phoneTextField: UITextField, codeTextField: UITextField)
//    {
//        let token = AppConstant.invoice_token
//        print("Voici est données de connexion pour WizAll 1: \(token)")
//        wizall_initiate(token: token, tel: tel, phoneTextField: phoneTextField, codeTextField: codeTextField)
//    }
    
    func WizAllPaymentConfirmation(tel: String, code: String)
    {
        print("Voici est données de connexion pour WizAll 2: \(tel) et \(code)")
        
        wizall_confirmation(code: code, tel: tel)
    }
    
    //MARK: Private Function
    
    private func wizall_initiate(token: String, tel: String, phoneTextField: UITextField, codeTextField: UITextField, initBnt: UIButton, confirmedBnt: UIButton)
    {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        
        let params: [String: Any] = [
            "customer_name": "Palouki",
            "customer_email": "chr2@gmail.com",
            "phone_number": tel,
            "invoice_token": token
        ]
        
        Alamofire.request("https://app.paydunya.com/api/v1/softpay/wizall-money-senegal", method: .post ,parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON
        {
            response in
            
            
            // On regarde la réponse renvoyée par la requete
            switch response.result
            {
                case let .success(value): // En cas de Succes de la requete
                    
                    let json = JSON(value)
                    
                    let message = json["message"].stringValue
                    
                    print("Voici la 1ere réponse pour WizALL: \(json)")
                
                    if message == "Vous n' avez pas assez de fonds! Veuillez recharger votre compte Wizall Money pour effectuer ce paiement"
                    {

                        self.WizAll_Initiate_Error_Alert()
                    }
                    else if message == "Requête de paiement effectuée!"
                    {
                        self.WizAll_Initiate_Success_Alert(phoneTextField: phoneTextField, codeTextField: codeTextField, initBnt: initBnt, confirmedBnt: confirmedBnt)
                    }
                    else
                    {
                        self.WizAll_Initiate_Error_Alert()
//                        self.WizAll_Confirmed_Error_Alert()
                    }
                
                case let .failure(error):
                    print("Ceci est votre erreur: \(error)")
            }
         
        }
    }
    
    private func wizall_confirmation(code: String, tel: String)
    {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        let params: Parameters = [
            "authorization_code": code,
            "phone_number": tel
        ]
        
        
        Alamofire.request("https://app.paydunya.com/api/v1/softpay/wizall-money-senegal/confirm", method: .post ,parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON
        {
            response in
            print("ResultJSON: \(response.result)")    // On affiche la réponse en JSON
            
            
            // On regarde la réponse renvoyée par la requete
            switch response.result
            {
                case let .success(value): // En cas de Succes de la requete
                    
                    let json = JSON(value)
                    
                    print("Voici la réponse fianle pour WizALL: \(json)")
                
                    if json["success"].boolValue
                    {
                        self.WizAll_Confirmed_Success_Alert()
                    }
                    else
                    {
                        self.WizAll_Confirmed_Error_Alert()
                    }
                
                case let .failure(error):
                    print("Ceci est votre erreur: \(error)")
            }
         
        }
    }
}


extension Senegal
{
    //MARK: Présentation de l'alerte
    
    public func WizAll_Initiate_Success_Alert(phoneTextField: UITextField, codeTextField: UITextField, initBnt: UIButton, confirmedBnt: UIButton)
    {
        let title = "Notification"
        let message = "Votre paiement avec wizall est initié avec succés. Veuillez saisir le code reçu pour confirmer l'opération."
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
            phoneTextField.isUserInteractionEnabled = false
            phoneTextField.backgroundColor = Colors.greyBorder!
            codeTextField.isHidden = false
            initBnt.isHidden = true
            initBnt.isEnabled = false
            confirmedBnt.isHidden = false
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        UIApplication.shared.windows.last?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    public func WizAll_Confirmed_Success_Alert()
    {
        let title = "Notification"
        let message = "Votre paiement avec wizall effectuée avec succés."
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
//            self.wizall_confirmation(code: code, tel: tel)
            self.removeFromSuperview()

            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        UIApplication.shared.windows.last?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    public func WizAll_Initiate_Error_Alert()
    {
        let title = "Alerte"
        let message = "Une erreur est survenu veuillez réessayer!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Réessayez", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Quittez", style: UIAlertAction.Style.default, handler: { (action) in
            
//            self.removeFromSuperview(s)
            alert.dismiss(animated: true, completion: nil)
            

        }))
        
        UIApplication.shared.windows.last?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    public func WizAll_Confirmed_Error_Alert()
    {
        let title = "Alerte"
        let message = "Une erreur est survenu veuillez réessayer!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Réessayez", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Quittez", style: UIAlertAction.Style.default, handler: { (action) in
            
            self.cancelAlert()
            alert.dismiss(animated: true, completion: nil)
            

        }))
        
        UIApplication.shared.windows.last?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    
    public func cancelAlert()
    {
        let title = "Alerte"
        let message = "Voulez-vous réellement annuler cette opération?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Oui", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Non", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }))
        
        UIApplication.shared.windows.last?.rootViewController?.present(alert, animated: true, completion: nil)

    }
    
    public func successAlert()
    {
        let title = "Notification"
        let message = "Votre opération s'est éffectuée avec succés!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        UIApplication.shared.windows.last?.rootViewController?.present(alert, animated: true, completion: nil)
        
//        self.present(alert, animated: true, completion: nil)
    }
    
}
