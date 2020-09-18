//
//  UITextFieldExtension.swift
//  PSR
//
//  Created by Mouhamed Camara on 6/12/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//


import Foundation
import UIKit


class TextField: UITextField
{
    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

private var __maxLengths = [UITextField: Int]()

extension UITextField
{
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
    
    func addBottomLine(color: UIColor)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 2)
        
        bottomLine.backgroundColor = color.cgColor
        
        self.borderStyle = UITextField.BorderStyle.none
        
        self.layer.masksToBounds = true
        
        self.layer.addSublayer(bottomLine)
    }
    
    //Ajouter l'image de gauche
        
    func addLeftView(image: UIImage, isSecure: Bool = false)
    {
        let imageView = UIImageView(frame: CGRect(x: 5, y: 10, width: 30, height: 30))
        imageView.image = image
        imageView.tintColor = .black //Colors.GreyishBrown
        if isSecure
        {
            let button = UIButton(frame: imageView.frame)
            button.tintColor = .black //Colors.GreyishBrown
            if #available(iOS 13.0, *)
            {
                let lock = UIImage(systemName: "lock.fill")
                let lockopen = UIImage(systemName: "lock.open.fill")
                button.setImage(lockopen!, for: .normal)
                button.setImage(lock!, for: .selected)
                button.isSelected = true
                button.addTarget(self, action: #selector(onClickEye), for: .touchUpInside)
                leftView = button
            }
            else
            {
                let eyeslash = UIImage(named: "eyeclosed")
                let eye = UIImage(named: "eyeopened")
                
                button.setImage(eye!, for: .normal)
                button.setImage(eyeslash!, for: .selected)
                button.isSelected = true
                button.addTarget(self, action: #selector(onClickEye), for: .touchUpInside)
                leftView = button
            }
        }
        else
        {
            leftView = imageView
        }
        
//        rightViewMode = .always
        leftViewMode = .always
    }
    
    
    //Ajouter l'image de gauche
    
    func addRightView(image: UIImage, isSecure: Bool = false)
    {
        let imageView = UIImageView(frame: CGRect(x: self.frame.size.width - 45, y: 10, width: 30, height: 30))
        imageView.image = image
        imageView.tintColor = #colorLiteral(red: 0, green: 0.5728718638, blue: 1, alpha: 1)
        if isSecure
        {
            let button = UIButton(frame: imageView.frame)
            button.tintColor = #colorLiteral(red: 0, green: 0.5728718638, blue: 1, alpha: 1)
            if #available(iOS 13.0, *)
            {
                let lock = UIImage(systemName: "lock.fill")
                let lockopen = UIImage(systemName: "lock.open.fill")
                button.setImage(lockopen!, for: .normal)
                button.setImage(lock!, for: .selected)
                button.isSelected = true
                button.addTarget(self, action: #selector(onClickEye), for: .touchUpInside)
                leftView = button
            }
            else
            {
                let eyeslash = UIImage(named: "eyeclosed")
                let eye = UIImage(named: "eyeopened")
                
                button.setImage(eye!, for: .normal)
                button.setImage(eyeslash!, for: .selected)
                button.isSelected = true
                button.addTarget(self, action: #selector(onClickEye), for: .touchUpInside)
                leftView = button
            }
        }
        else
        {
            leftView = imageView
        }
        
//        rightViewMode = .always
        leftViewMode = .always
    }
    
    @objc func onClickEye(sender: UIButton)
    {
        self.isSecureTextEntry = !self.isSecureTextEntry
        sender.isSelected = !sender.isSelected
    }
}

private var tappableKey: UInt8 = 0
private var actionKey: UInt8 = 1
public typealias SimpleClosure = (() -> ())

extension UITextField
{
    @objc var callback: SimpleClosure
        {
        get {
            return (objc_getAssociatedObject(self, &actionKey) as? SimpleClosure ?? nil)!
        }
        set {
            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc private func tapped()
    {
        callback()
    }
    
    
    var gesture: UITapGestureRecognizer
    {
        get {
            return UITapGestureRecognizer(target: self, action: #selector(tapped))
        }
    }
    
    var tappable: Bool!
    {
        get {
            return objc_getAssociatedObject(self, &tappableKey) as? Bool
        }
        set(newValue)
        {
            objc_setAssociatedObject(self, &tappableKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            self.addTapGesture()
        }
    }
    
    fileprivate func addTapGesture()
    {
        if (self.tappable)
        {
            self.gesture.numberOfTapsRequired = 1
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(gesture)
        }
    }
}

