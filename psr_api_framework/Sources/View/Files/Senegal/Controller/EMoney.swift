//
//  FreeMoney.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

protocol EMoneyDelegate: class
{
    func paymentWithEM(tel: String)
}

class EMoney: UIView
{
    //MARK: Outlets
        
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var telTextField: MDCTextField!
        
    //MARK: Actions
    
    @IBAction func payWithPayDunyaButton(_ sender: UIButton)
    {
        guard let delegate = delegate else { return }
        delegate.paymentWithEM(tel: telTextField.text!)
    }
    
    //MARK: Properties
    
    weak var delegate: EMoneyDelegate? = nil
    
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
        
        
        telTextField.clearButton.isHidden = true
        
        if #available(iOS 13.0, *)
        {
            telTextField.addRightView(image: UIImage(systemName: "phone.fill")!)
        }
        else
        {
            // Fallback on earlier versions
        }
    }
}

extension EMoney
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
