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
    
    @IBOutlet weak var telTextField: MDCTextField!
    
    @IBOutlet weak var codeTextField: MDCTextField!
    
    @IBOutlet weak var paymentBnt: UIButton!
    
    @IBOutlet weak var confirmPaymentBnt: UIButton!
    
    
    //MARK: Actions
    
    
    @IBAction func payWithPayDunyaButton(_ sender: UIButton)
    {
        customActivityIndicatory(theIframe.view)
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
    
    var controller1: MDCTextInputControllerOutlined?
    var controller2: MDCTextInputControllerOutlined?
    
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
        
        initializeHideKeyboard()
        telTextField.placeholderLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        telTextField.placeholderLabel.text = "N° de téléphone"
        controller1 = MDCTextInputControllerOutlined(textInput: telTextField)
        controller1!.activeColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        controller1!.disabledColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        controller1!.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

        
        codeTextField.placeholderLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        codeTextField.placeholderLabel.text = "Code d'autorisation"
        controller2 = MDCTextInputControllerOutlined(textInput: codeTextField)
        controller2!.activeColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        controller2!.disabledColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        controller2!.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        controller1!.textInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        
        telTextField.clearButton.isHidden = true
        codeTextField.clearButton.isHidden = true
        
        
        
        if #available(iOS 13.0, *)
        {
            telTextField.addRightView(image: UIImage(systemName: "phone.fill")!)
            
            codeTextField.addRightView(image: UIImage(systemName: "lock.fill")!)

        }
        else
        {
            // Fallback on earlier versions
        }
        
    }
}


extension WizAll
{
    func initializeHideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
        target: self,
        action: #selector(dismissMyKeyboard))

        self.addGestureRecognizer(tap)
    }

    @objc func dismissMyKeyboard()
    {
        self.endEditing(true)
    }
}
