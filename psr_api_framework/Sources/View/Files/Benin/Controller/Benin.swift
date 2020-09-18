//
//  Benin.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit

class Benin: UIView
{
    //MARK: Outlets
            
    @IBOutlet weak var stackView: UIStackView!
            
    @IBOutlet weak var visaButton: addRoundingButton!
    
    @IBOutlet weak var mtnButton: addRoundingButton!
    
    
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
//                visa.delegate = self
            self.addSubview(visa)
        }
    
        visaButton.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        mtnButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func mtnButton(_ sender: addRoundingButton)
    {
        if let mtn = frameworkBundle?.loadNibNamed("MTNB", owner: self, options: nil)?.first as? MTNB
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


extension Benin: MTNBDelegate
{
//    func paymentWithVisa(tel: String)
//    {
//        print("Voici est données de connexion pour Visa: \(tel)")
//    }
    
    func paymentWithMTNB(tel: String)
    {
        print("Voici est données de connexion pour MTNB: \(tel)")
    }
    
}

