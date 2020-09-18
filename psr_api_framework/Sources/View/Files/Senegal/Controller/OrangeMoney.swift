//
//  OrangeMoney.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields


protocol OMoneyDelegate: class
{
    func paymentWithOM(tel: String, code: String)
}

class OrangeMoney: UIView
{
    //MARK: Outlets
        
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var telTextField: MDCOutlinedTextField!
    
    
    @IBOutlet weak var codeTextField: MDCOutlinedTextField!
    
    
    //MARK: Actions
    
    
    @IBAction func payWithPayDunyaButton(_ sender: UIButton)
    {
        guard let delegate = delegate else { return }
        delegate.paymentWithOM(tel: telTextField.text!, code: codeTextField.text!)
    }
    
    //MARK: Properties
    
    weak var delegate: OMoneyDelegate? = nil
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        telTextField.layer.borderColor = UIColor.blue.cgColor
        telTextField.layer.borderWidth = 0.5
        telTextField.layer.cornerRadius = 3
        
        
        codeTextField.layer.borderColor = UIColor.blue.cgColor
        codeTextField.layer.borderWidth = 0.5
        codeTextField.layer.cornerRadius = 3
        
//        telTextField.label.
//        telTextField.label.text = "Email ou N° de téléphone"
//        telTextField.label.textColor = .red
        
//        telTextField.leadingAssistiveLabel.text = "Email ou N° de téléphone"
//        telTextField.setOutlineColor(.systemGray6, for: .normal)
//        telTextField.setOutlineColor(#colorLiteral(red: 0, green: 0.5728718638, blue: 1, alpha: 1), for: .editing)
        
        if #available(iOS 13.0, *)
        {
            telTextField.addRightView(image: UIImage(systemName: "person.fill")!)
        }
        else
        {
            // Fallback on earlier versions
        }
        
        telTextField.sizeToFit()
        
//        codeTextField.label.text = "Mot de passe"
//        codeTextField.label.textColor = .red
//
//        codeTextField.leadingAssistiveLabel.text = ""
//        codeTextField.setOutlineColor(.systemGray6, for: .normal)
//        codeTextField.setOutlineColor(#colorLiteral(red: 0, green: 0.5728718638, blue: 1, alpha: 1), for: .editing)
//
        if #available(iOS 13.0, *)
        {
            codeTextField.addRightView(image: UIImage(systemName: "lock.fill")!)
        }
        else
        {
            // Fallback on earlier versions
        }

        
        codeTextField.sizeToFit()
//        telTextField.layer.borderWidth = 0.8
//        telTextField.layer.borderColor = UIColor.systemGray4.cgColor
//        telTextField.layer.cornerRadius = 5
//
//        codeTextField.layer.borderWidth = 0.8
//        codeTextField.layer.borderColor = UIColor.systemGray4.cgColor
//        codeTextField.layer.cornerRadius = 5
//        setup()
    }
    

//    //MARK: Private Functions
//    private func setup()
//    {
//        telTextField.label.text = "Email ou N° de téléphone"
//        telTextField.label.textColor = .red
//        
//        telTextField.leadingAssistiveLabel.text = ""
//        telTextField.setOutlineColor(.systemGray6, for: .normal)
//        telTextField.setOutlineColor(#colorLiteral(red: 0, green: 0.5728718638, blue: 1, alpha: 1), for: .editing)
//        
//        telTextField.addRightView(image: UIImage(systemName: "person.fill")!)
//        
//        telTextField.sizeToFit()
//        
//        codeTextField.label.text = "Mot de passe"
//        codeTextField.label.textColor = .red
//        
//        codeTextField.leadingAssistiveLabel.text = ""
//        codeTextField.setOutlineColor(.systemGray6, for: .normal)
//        codeTextField.setOutlineColor(#colorLiteral(red: 0, green: 0.5728718638, blue: 1, alpha: 1), for: .editing)
//        
//        codeTextField.addRightView(image: UIImage(systemName: "lock.fill")!)
//
//        
//        codeTextField.sizeToFit()
//        
//    }
    
    
}
