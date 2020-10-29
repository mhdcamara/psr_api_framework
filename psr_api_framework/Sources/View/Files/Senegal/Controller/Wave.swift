//
//  Wave.swift
//  psr_api_framework
//
//  Created by Mouhamed Camara on 10/23/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//


import UIKit
import MaterialComponents.MaterialTextFields


protocol WaveDelegate: class
{
    func paymentWithWave(tel: String)
}

class Wave: UIView
{
    //MARK: Outlets
            
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var telTextField: MDCTextField!
    
    
    //MARK: Actions
    
    
    @IBAction func payWithWaveButton(_ sender: UIButton)
    {
        guard let delegate = delegate else { return }
        delegate.paymentWithWave(tel: telTextField.text!)
    }
    
    //MARK: Properties

    weak var delegate: WaveDelegate? = nil
    
    var controller1: MDCTextInputControllerOutlined?

    
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

        if #available(iOS 13.0, *)
        {
            telTextField.addRightView(image: UIImage(systemName: "phone.fill")!)
        }
        else
        {
            
        }
        
        telTextField.sizeToFit()
    }
}


extension Wave
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
