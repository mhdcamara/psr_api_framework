//
//  Senegal.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/7/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class Senegal: UIView
{
    //MARK: Outlets
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var paydunyaButton: addRoundingButton!
    
    @IBOutlet weak var visaButton: addRoundingButton!
    
    @IBOutlet weak var wariButton: addRoundingButton!
    
    @IBOutlet weak var omoneyButton: addRoundingButton!
    
    @IBOutlet weak var wizallButton: addRoundingButton!
    
    //MARK: Actions
    
    @IBAction func paydunyaButton(_ sender: addRoundingButton)
    {
        paydunyaPayment()
    }
    
    @IBAction func cartButton(_ sender: addRoundingButton)
    {
        visaPayment()
    }
    
    @IBAction func omoneyButton(_ sender: addRoundingButton)
    {
        omoneyPayment()
    }
    
    
    @IBAction func wariButton(_ sender: addRoundingButton)
    {
        wariPayment()
    }
    
    @IBAction func wizallButton(_ sender: addRoundingButton)
    {
        wizallPayment()
    }
    
//    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: Properties
    
    var pdunya = PayDunya()
    
    var isFirst = true
    
    var tagged = 0
    
    let frameworkBundle = Bundle(identifier: "com.paydunya.psr-api-framework")
        
    var wari = Wari()
    
    var wizall = WizAll()
    
    var omoney = OrangeMoney()
    
    var visa = Visa()
    
    var paydunya = PayDunya()
    
    var free = FreeMoney()
    
    var emoney = EMoney()
    
    var wave = Wave()
    
    var bnt1 = addRoundingButton(type: .custom)
    
    var bnt2 = addRoundingButton(type: .custom)
    
    var bnt3 = addRoundingButton(type: .custom)
    
    var bnt4 = addRoundingButton(type: .custom)
    
    var bnt5 = addRoundingButton(type: .custom)
    
    var bnt6 = addRoundingButton(type: .custom)
    
    var bnt7 = addRoundingButton(type: .custom)
    
    var bnt8 = addRoundingButton(type: .custom)
    
    var scrollView = UIScrollView()
    
    let buttonPadding: CGFloat = 8
    
    var xOffset: CGFloat = 8
    

    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 20, width: self.bounds.width, height: 62))
        self.addSubview(scrollView)
        
        scrollView.backgroundColor = UIColor.white
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        xOffset = 0
        
        for i in 0 ... 7
        {
            
//            let button = addRoundingButton(type: .custom)
//            button.tag = i
            
            if i == 0
            {
                let img = UIImage(named: "paydunya-logo-mobile", in: frameworkBundle, compatibleWith: nil)
                bnt1.setImage(img, for: .normal)
                
                bnt1.addTarget(self, action: #selector(paydunyaPayment), for: .touchUpInside)
                
                bnt1.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt1)
            }
            else if i == 1
            {
                let img = UIImage(named: "card-logo-mobile", in: frameworkBundle, compatibleWith: nil)
                bnt2.setImage(img, for: .normal)
                bnt2.addTarget(self, action: #selector(visaPayment), for: .touchUpInside)
                
                bnt2.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt2)
            }
            else if i == 2
            {
                let img = UIImage(named: "orangemoney-logo-mobile", in: frameworkBundle, compatibleWith: nil)
                bnt3.setImage(img, for: .normal)
                bnt3.addTarget(self, action: #selector(omoneyPayment), for: .touchUpInside)
                bnt3.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt3)
            }
            else if i == 3
            {
                let img = UIImage(named: "wari-proximo-logo-mobile", in: frameworkBundle, compatibleWith: nil)
                bnt4.setImage(img, for: .normal)
                bnt4.addTarget(self, action: #selector(wariPayment), for: .touchUpInside)
                bnt4.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt4)
            }
            else if i == 4
            {
                let img = UIImage(named: "Wizall", in: frameworkBundle, compatibleWith: nil)
                bnt5.setImage(img, for: .normal)
                bnt5.addTarget(self, action: #selector(wizallPayment), for: .touchUpInside)
                bnt5.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt5)
            }
            else if i == 5
            {
                let img = UIImage(named: "Free", in: frameworkBundle, compatibleWith: nil)
                bnt6.setImage(img, for: .normal)
                bnt6.addTarget(self, action: #selector(freemoneyPayment), for: .touchUpInside)
                bnt6.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt6)
            }
            else if i == 6
            {
                let img = UIImage(named: "EMoney", in: frameworkBundle, compatibleWith: nil)
                bnt7.setImage(img, for: .normal)
                bnt7.addTarget(self, action: #selector(emoneyPayment), for: .touchUpInside)
                bnt7.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt7)
            }
            else if i == 7
            {
                let img = UIImage(named: "wave", in: frameworkBundle, compatibleWith: nil)
                bnt8.setImage(img, for: .normal)
                bnt8.addTarget(self, action: #selector(wavePayment), for: .touchUpInside)
                bnt8.frame = CGRect(x: xOffset, y: 0, width: 63, height: 62)
                scrollView.addSubview(bnt8)
            }
        
            xOffset = xOffset + CGFloat(buttonPadding) + 63
            
        }

        scrollView.contentSize = CGSize(width: xOffset, height: scrollView.frame.height)
        
        
        
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
    
    //MARK: Functions
    
    @objc func paydunyaPayment()
    {
        if let pd = frameworkBundle?.loadNibNamed("PayDunya", owner: self, options: nil)?.first as? PayDunya
        {
            let y = scrollView.frame.origin.y
            pd.frame.origin = CGPoint(x: 0, y: y + 70)
            pd.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleLeftMargin]
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
            pdunya = pd
            
            print("Voici le tag: \(tagged)  \(isFirst)")
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: pdunya)
                tagged = 1
            }
            else
            {
                applyTransition(vw: pdunya)
                tagged = 1
            }
            
            paydunya = pd
            
            
        }
        
        bnt1.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        bnt2.layer.borderColor = UIColor.lightGray.cgColor
        bnt3.layer.borderColor = UIColor.lightGray.cgColor
        bnt4.layer.borderColor = UIColor.lightGray.cgColor
        bnt5.layer.borderColor = UIColor.lightGray.cgColor
        bnt6.layer.borderColor = UIColor.lightGray.cgColor
        bnt7.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    @objc func visaPayment()
    {
        if let visa = frameworkBundle?.loadNibNamed("Visa", owner: self, options: nil)?.first as? Visa
        {
            let y = scrollView.frame.origin.y
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
        
        bnt1.layer.borderColor = UIColor.lightGray.cgColor
        bnt2.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        bnt3.layer.borderColor = UIColor.lightGray.cgColor
        bnt4.layer.borderColor = UIColor.lightGray.cgColor
        bnt5.layer.borderColor = UIColor.lightGray.cgColor
        bnt6.layer.borderColor = UIColor.lightGray.cgColor
        bnt7.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func omoneyPayment()
    {
        if let om = frameworkBundle?.loadNibNamed("OrangeMoney", owner: self, options: nil)?.first as? OrangeMoney
        {
            let y = scrollView.frame.origin.y
            om.frame.origin = CGPoint(x: 0, y: y + 70)
            om.layer.borderWidth = 0.8
            om.layer.borderColor = UIColor.lightGray.cgColor
            om.layer.cornerRadius = 5
            om.delegate = self
            
            print("Voici le tag: \(tagged)  \(isFirst)")
            
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
        
        bnt1.layer.borderColor = UIColor.lightGray.cgColor
        bnt2.layer.borderColor = UIColor.lightGray.cgColor
        bnt3.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        bnt4.layer.borderColor = UIColor.lightGray.cgColor
        bnt5.layer.borderColor = UIColor.lightGray.cgColor
        bnt6.layer.borderColor = UIColor.lightGray.cgColor
        bnt7.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func wariPayment()
    {
        if let wari = frameworkBundle?.loadNibNamed("Wari", owner: self, options: nil)?.first as? Wari
        {
            let y = scrollView.frame.origin.y
            wari.frame.origin = CGPoint(x: 0, y: y + 70)
            wari.layer.borderWidth = 0.8
            wari.layer.borderColor = UIColor.lightGray.cgColor
            wari.layer.cornerRadius = 5
            wari.delegate = self
            
            print("Voici le tag: \(tagged)  \(isFirst)")
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: wari)
                tagged = 4
            }
            else
            {
                applyTransition(vw: wari)
                tagged = 4
            }
            
            self.wari = wari
            
            
        }
        
        bnt1.layer.borderColor = UIColor.lightGray.cgColor
        bnt2.layer.borderColor = UIColor.lightGray.cgColor
        bnt3.layer.borderColor = UIColor.lightGray.cgColor
        bnt4.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        bnt5.layer.borderColor = UIColor.lightGray.cgColor
        bnt6.layer.borderColor = UIColor.lightGray.cgColor
        bnt7.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func wizallPayment()
    {
        if let wizall = frameworkBundle?.loadNibNamed("WizAll", owner: self, options: nil)?.first as? WizAll
        {
            let y = scrollView.frame.origin.y
            
            wizall.frame.origin = CGPoint(x: 0, y: y + 70)
            wizall.layer.borderWidth = 0.8
            wizall.layer.borderColor = UIColor.lightGray.cgColor
            wizall.layer.cornerRadius = 5
            wizall.delegate = self

            print("On y est: \(wizall.frame.size)")
            print("Voici le tag: \(tagged)  \(isFirst)")
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: wizall)
                tagged = 5
            }
            else
            {
                applyTransition(vw: wizall)
                tagged = 5
            }
            
            self.wizall = wizall
            
        }
        
        bnt1.layer.borderColor = UIColor.lightGray.cgColor
        bnt2.layer.borderColor = UIColor.lightGray.cgColor
        bnt3.layer.borderColor = UIColor.lightGray.cgColor
        bnt4.layer.borderColor = UIColor.lightGray.cgColor
        bnt5.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        bnt6.layer.borderColor = UIColor.lightGray.cgColor
        bnt7.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func freemoneyPayment()
    {
        if let free = frameworkBundle?.loadNibNamed("FreeMoney", owner: self, options: nil)?.first as? FreeMoney
        {
            let y = scrollView.frame.origin.y
            free.frame.origin = CGPoint(x: 0, y: y + 70)
            free.layer.borderWidth = 0.8
            free.layer.borderColor = UIColor.lightGray.cgColor
            free.layer.cornerRadius = 5
            free.delegate = self
            
            print("Voici le tag: \(tagged)  \(isFirst)")
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: free)
                tagged = 6
            }
            else
            {
                applyTransition(vw: free)
                tagged = 6
            }
            
            self.free = free
        }
        
        bnt1.layer.borderColor = UIColor.lightGray.cgColor
        bnt2.layer.borderColor = UIColor.lightGray.cgColor
        bnt3.layer.borderColor = UIColor.lightGray.cgColor
        bnt4.layer.borderColor = UIColor.lightGray.cgColor
        bnt5.layer.borderColor = UIColor.lightGray.cgColor
        bnt6.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
        bnt7.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func emoneyPayment()
    {
        if let emoney = frameworkBundle?.loadNibNamed("EMoney", owner: self, options: nil)?.first as? EMoney
        {
            let y = scrollView.frame.origin.y
            emoney.frame.origin = CGPoint(x: 0, y: y + 70)
            emoney.layer.borderWidth = 0.8
            emoney.layer.borderColor = UIColor.lightGray.cgColor
            emoney.layer.cornerRadius = 5
            emoney.delegate = self
            
            print("Voici le tag: \(tagged)  \(isFirst)")
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: emoney)
                tagged = 7
            }
            else
            {
                applyTransition(vw: emoney)
                tagged = 7
            }
            
            self.emoney = emoney
        }
        
        bnt1.layer.borderColor = UIColor.lightGray.cgColor
        bnt2.layer.borderColor = UIColor.lightGray.cgColor
        bnt3.layer.borderColor = UIColor.lightGray.cgColor
        bnt4.layer.borderColor = UIColor.lightGray.cgColor
        bnt5.layer.borderColor = UIColor.lightGray.cgColor
        bnt6.layer.borderColor = UIColor.lightGray.cgColor
        bnt7.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
    }
    
    @objc func wavePayment()
    {
        if let wave = frameworkBundle?.loadNibNamed("Wave", owner: self, options: nil)?.first as? Wave
        {
            let y = scrollView.frame.origin.y
            wave.frame.origin = CGPoint(x: 0, y: y + 70)
            wave.layer.borderWidth = 0.8
            wave.layer.borderColor = UIColor.lightGray.cgColor
            wave.layer.cornerRadius = 5
            wave.delegate = self
            
            print("Voici le tag: \(tagged)  \(isFirst)")
            
            if isFirst
            {
                firstTransition(view_one: self, view_two: wave)
                tagged = 8
            }
            else
            {
                applyTransition(vw: wave)
                tagged = 8
            }
            
            self.wave = wave
        }
        
        bnt1.layer.borderColor = UIColor.lightGray.cgColor
        bnt2.layer.borderColor = UIColor.lightGray.cgColor
        bnt3.layer.borderColor = UIColor.lightGray.cgColor
        bnt4.layer.borderColor = UIColor.lightGray.cgColor
        bnt5.layer.borderColor = UIColor.lightGray.cgColor
        bnt6.layer.borderColor = UIColor.lightGray.cgColor
        bnt7.layer.borderColor = UIColor.lightGray.cgColor
        bnt8.layer.borderColor = #colorLiteral(red: 0.003921568627, green: 0.4392156863, blue: 0.6980392157, alpha: 1)
    }
}

extension Senegal: PayDunyaDelegate, WariDelegate
{
    func paymentWithPD(tel: String, code: String)
    {
        print("Voici est données de connexion pour PD: \(tel) et \(code)")
    }
    
    func paymentWithWari(tel: String)
    {
        print("Voici est données de connexion pour Wari: \(tel)")
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
            transitionAnimation(view_one: self.wari, view_two: vw)
        }
        else if tagged == 5
        {
            transitionAnimation(view_one: self.wizall, view_two: vw)
        }
        else if tagged == 6
        {
            transitionAnimation(view_one: self.free, view_two: vw)
        }
        else if tagged == 7
        {
            transitionAnimation(view_one: self.emoney, view_two: vw)
        }
        else if tagged == 8
        {
            transitionAnimation(view_one: self.wave, view_two: vw)
        }
    }
}
