//
//  Wari.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields


protocol WariDelegate: class
{
    func paymentWithWari(tel: String)
}

class Wari: UIView
{
    //MARK: Outlets
            
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var telTextField: MDCOutlinedTextField!
    
    
//        @IBOutlet weak var codeTextField: MDCOutlinedTextField!
    
    
    //MARK: Actions
    
    
    @IBAction func payWithPayDunyaButton(_ sender: UIButton)
    {
        guard let delegate = delegate else { return }
        delegate.paymentWithWari(tel: telTextField.text!)
    }
    
    //MARK: Properties

    weak var delegate: WariDelegate? = nil
    
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
        
        if #available(iOS 13.0, *)
        {
            telTextField.addRightView(image: UIImage(systemName: "phone.fill")!)
        }
        else
        {
            // Fallback on earlier versions
        }
        
        telTextField.sizeToFit()
    }
}
