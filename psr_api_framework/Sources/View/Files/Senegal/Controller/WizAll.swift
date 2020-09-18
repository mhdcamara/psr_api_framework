//
//  WizAll.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/16/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields


protocol WizAllDelegate: class
{
    func paymentWithWizAll(tel: String, phoneTextField: UITextField, codeTextField: UITextField, initBnt: UIButton, confirmedBnt: UIButton)
    
    func WizAllPaymentConfirmation(tel: String, code: String)
}


class WizAll: UIView
{
    //MARK: Outlets
            
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var telTextField: MDCOutlinedTextField!
    
    @IBOutlet weak var codeTextField: MDCOutlinedTextField!
    
    @IBOutlet weak var paymentBnt: UIButton!
    
    @IBOutlet weak var confirmPaymentBnt: UIButton!
    
    
    //MARK: Actions
    
    
    @IBAction func payWithPayDunyaButton(_ sender: UIButton)
    {
        guard let delegate = delegate else { return }
        delegate.paymentWithWizAll(tel: telTextField.text!, phoneTextField: telTextField, codeTextField: codeTextField, initBnt: paymentBnt, confirmedBnt: confirmPaymentBnt)
    }
    
    
    @IBAction func confirmPaymentButton(_ sender: UIButton)
    {
        guard let delegate = delegate else { return }
        delegate.WizAllPaymentConfirmation(tel: telTextField.text!, code: codeTextField.text!)
    }
    
    //MARK: Properties
    
    weak var delegate: WizAllDelegate? = nil
    
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
        
        if #available(iOS 13.0, *)
        {
            telTextField.addRightView(image: UIImage(systemName: "person.fill")!)
            
            codeTextField.addRightView(image: UIImage(systemName: "lock.fill")!)

        }
        else
        {
            // Fallback on earlier versions
        }
        
        telTextField.sizeToFit()

        
        codeTextField.sizeToFit()
    }
}
