//
//  CIvoire.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit

class CIvoire: UIView
{
    //MARK: Outlets
        
    @IBOutlet weak var stackView: UIStackView!
            
    @IBOutlet weak var visaButton: addRoundingButton!
    
    @IBOutlet weak var mtnButton: addRoundingButton!
    
    @IBOutlet weak var omoneyButton: addRoundingButton!
    
    //MARK: Actions
    
    @IBAction func cartButton(_ sender: addRoundingButton)
    {
        if let visa = frameworkBundle?.loadNibNamed("Visa", owner: self, options: nil)?.first as? Visa
        {
        let y = stackView.frame.origin.y
        visa.frame.origin = CGPoint(x: 0, y: y + 70)
        visa.layer.borderWidth = 0.8
        visa.layer.borderColor = UIColor.lightGray.cgColor
        visa.layer.cornerRadius = 5
//        visa.delegate = self
        self.addSubview(visa)
        }
        
        visaButton.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        mtnButton.layer.borderColor = UIColor.lightGray.cgColor
        omoneyButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func omoneyButton(_ sender: addRoundingButton)
    {
//        pd.removeFromSuperview()
//
        if let om = frameworkBundle?.loadNibNamed("OrangeMoneyCI", owner: self, options: nil)?.first as? OrangeMoneyCI
        {
            let y = stackView.frame.origin.y
            om.frame.origin = CGPoint(x: 0, y: y + 70)
            om.layer.borderWidth = 0.8
            om.layer.borderColor = UIColor.lightGray.cgColor
            om.layer.cornerRadius = 5
            om.delegate = self
            self.addSubview(om)
        }
        
        
        
        visaButton.layer.borderColor = UIColor.lightGray.cgColor
        mtnButton.layer.borderColor = UIColor.lightGray.cgColor
        omoneyButton.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
    }
    
    
    @IBAction func mtnButton(_ sender: addRoundingButton)
    {
        if let mtn = frameworkBundle?.loadNibNamed("MTNCI", owner: self, options: nil)?.first as? MTNCI
        {
            let y = stackView.frame.origin.y
            mtn.frame.origin = CGPoint(x: 0, y: y + 70)
            mtn.layer.borderWidth = 0.8
            mtn.layer.borderColor = UIColor.lightGray.cgColor
            mtn.layer.cornerRadius = 5
            mtn.delegate = self
            self.addSubview(mtn)
        }
//
        visaButton.layer.borderColor = UIColor.lightGray.cgColor
        mtnButton.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        omoneyButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    //MARK: Properties
    
    let frameworkBundle = Bundle(identifier: "com.paydunya.psr-api-framework")

    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }

}

extension CIvoire: MTNCIDelegate, OMoneyCIDelegate
{
//    func paymentWithVisa(tel: String)
//    {
//        print("Voici est données de connexion pour Visa: \(tel)")
//    }
//    
    func paymentWithMTNCI(tel: String)
    {
        print("Voici est données de connexion pour MTN: \(tel)")
    }
    
    func paymentWithOMCI(tel: String)
    {
        print("Voici est données de connexion pour OrangeMoneyCI: \(tel)")
    }
    
}

