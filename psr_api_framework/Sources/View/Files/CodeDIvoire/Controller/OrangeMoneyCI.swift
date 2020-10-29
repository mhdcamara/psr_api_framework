//
//  OrangeMoneyCI.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields
import WebKit

protocol OMoneyCIDelegate: class
{
    func paymentWithOMCI(tel: String)
}


class OrangeMoneyCI: UIView, WKNavigationDelegate, WKUIDelegate
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
        delegate.paymentWithOMCI(tel: telTextField.text!)
    }
    
    //MARK: Properties

    weak var delegate: OMoneyCIDelegate? = nil
    
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
            // Fallback on earlier versions
        }
    }
    
    
    
    //MARK: WEBVIEW
    
    //MARK: Outlets
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    //MARK: Actions
    
    
    //MARK: Properties

    
//    required init?(coder: NSCoder)
//    {
//        super.init(coder: coder)
//
//        self.addSubview(webView)
//
//        webView.allowsBackForwardNavigationGestures = true
//
//        if #available(iOS 11.0, *)
//        {
//            NSLayoutConstraint.activate([
//                webView.topAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//                webView.leftAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
//                webView.bottomAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
//                webView.rightAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
//            ])
//        }
//        else
//        {
//            // Fallback on earlier versions
//        }
//
//        customActivityIndicatory(theIframe.view, startAnimate: true)
//        webView.load(URLRequest(url: URL(string: AppConstant.payment_url)!))
//
//    }
//
//    override init(frame: CGRect)
//    {
//        super.init(frame: frame)
//
//        self.addSubview(webView)
//
//        webView.allowsBackForwardNavigationGestures = true
//
//        if #available(iOS 11.0, *)
//        {
//            NSLayoutConstraint.activate([
//                webView.topAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//                webView.leftAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
//                webView.bottomAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
//                webView.rightAnchor
//                    .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
//            ])
//        }
//        else
//        {
//            // Fallback on earlier versions
//        }
//
//        webView.load(URLRequest(url: URL(string: AppConstant.payment_url)!))
//    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
//    {
//        print("finish to load")
//
//
//        customActivityIndicatory(theIframe.view, startAnimate: false)
//        if let url = webView.url?.absoluteString
//        {
//            print("url = \(url)")
//        }
//    }
}

extension OrangeMoneyCI
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
