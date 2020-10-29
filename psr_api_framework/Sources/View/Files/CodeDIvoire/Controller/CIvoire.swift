//
//  CIvoire.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit

class CIvoire: UIView, PayDunyaDelegate
{
    
    //MARK: Outlets
        
    @IBOutlet weak var stackView: UIStackView!
            
    @IBOutlet weak var paydunyaButton: addRoundingButton!

    @IBOutlet weak var visaButton: addRoundingButton!
    
    @IBOutlet weak var mtnButton: addRoundingButton!
    
    @IBOutlet weak var omoneyButton: addRoundingButton!
    
    //MARK: Actions
    
    @IBAction func paydunyaButton(_ sender: addRoundingButton)
    {
        
        
        if let pd = frameworkBundle?.loadNibNamed("PayDunya", owner: self, options: nil)?.first as? PayDunya
        {
            let y = stackView.frame.origin.y
            pd.frame.origin = CGPoint(x: 0, y: y + 70)
            pd.layer.borderWidth = 0.8
            if #available(iOS 13.0, *)
            {
                pd.layer.borderColor = UIColor.systemGray6.cgColor
            }
            else
            {
                
            }
            if #available(iOS 11.0, *)
            {
                pd.layer.borderColor = Colors.greyBorder?.cgColor
            }
            else
            {
                // Fallback on earlier versions
            }
            
            pd.layer.cornerRadius = 5
            pd.delegate = self
            paydunya = pd
            
            print("Voici le tag: \(tagged)  \(isFirst)")
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: pd)
                tagged = 1
            }
            else
            {
                applyTransition(vw: pd)
                tagged = 1
            }
            
            paydunya = pd
            
            
        }
        
        paydunyaButton.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        visaButton.layer.borderColor = UIColor.lightGray.cgColor
        omoneyButton.layer.borderColor = UIColor.lightGray.cgColor
        mtnButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func cartButton(_ sender: addRoundingButton)
    {
        if let visa = frameworkBundle?.loadNibNamed("Visa", owner: self, options: nil)?.first as? Visa
        {
            let y = stackView.frame.origin.y
            visa.frame.origin = CGPoint(x: 0, y: y + 70)
            visa.layer.borderWidth = 0.8
            visa.layer.borderColor = UIColor.lightGray.cgColor
            visa.layer.cornerRadius = 5
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: visa)
                tagged = 2
            }
            else
            {
                applyTransition(vw: visa)
                tagged = 2
            }
            self.visa = visa
        }
        
        visaButton.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        mtnButton.layer.borderColor = UIColor.lightGray.cgColor
        omoneyButton.layer.borderColor = UIColor.lightGray.cgColor
        paydunyaButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func omoneyButton(_ sender: addRoundingButton)
    {
        
        if let om = frameworkBundle?.loadNibNamed("OrangeMoneyCI", owner: self, options: nil)?.first as? OrangeMoneyCI
        {
            let y = stackView.frame.origin.y
            om.frame.origin = CGPoint(x: 0, y: y + 70)
            om.layer.borderWidth = 0.8
            om.layer.borderColor = UIColor.lightGray.cgColor
            om.layer.cornerRadius = 5
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: om)
                tagged = 3
            }
            else
            {
                applyTransition(vw: om)
                tagged = 3
            }
    
            omoney = om
        }
        
        visaButton.layer.borderColor = UIColor.lightGray.cgColor
        mtnButton.layer.borderColor = UIColor.lightGray.cgColor
        paydunyaButton.layer.borderColor = UIColor.lightGray.cgColor
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
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: mtn)
                tagged = 4
            }
            else
            {
                applyTransition(vw: mtn)
                tagged = 4
            }
    
            self.mtn = mtn
        }

        visaButton.layer.borderColor = UIColor.lightGray.cgColor
        mtnButton.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        omoneyButton.layer.borderColor = UIColor.lightGray.cgColor
        paydunyaButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    //MARK: Properties
    
    let frameworkBundle = Bundle(identifier: "com.paydunya.psr-api-framework")
    
    var isFirst = true
    
    var tagged = 0
    
    var omoney = OrangeMoneyCI()
    
    var visa = Visa()
    
    var paydunya = PayDunya()
    
    
    var mtn = MTNCI()

    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }

}

extension CIvoire: MTNCIDelegate
{
    
    func paymentWithPD(tel: String, code: String)
    {
        print("Voici est données de connexion pour MTN: \(tel)")
    }
    
    func paymentWithMTNCI(tel: String)
    {
        print("Voici est données de connexion pour MTN: \(tel)")
    }
    
    func paymentWithOMCI(tel: String)
    {
        print("Voici est données de connexion pour OrangeMoneyCI: \(tel)")
    }
    
    func transitionAnimation(view_one: UIView, view_two: UIView)
    {
        UIView.transition(from: view_one,
                to: view_two,
                duration: 1.5,
                options: [.transitionFlipFromLeft, .showHideTransitionViews],
                completion: { _ in
                    self.addSubview(view_two)
        })
    }
    
    func firstTransition(view_one: UIView, view_two: UIView)
    {
        isFirst = !isFirst
        
        UIView.transition(with: view_one, duration: 1.5, options: [.transitionCurlUp, .showHideTransitionViews], animations: {
            self.isHidden = false
            self.addSubview(view_two)
        }, completion: nil)
    }
    
    func applyTransition(vw: UIView)
    {
        if tagged == 1
        {
            transitionAnimation(view_one: self.paydunya, view_two: vw)
        }
        else if tagged == 2
        {
            transitionAnimation(view_one: self.visa, view_two: vw)
        }
        else if tagged == 3
        {
            transitionAnimation(view_one: self.omoney, view_two: vw)
        }
        else if tagged == 4
        {
            transitionAnimation(view_one: self.mtn, view_two: vw)
        }
    }
}

