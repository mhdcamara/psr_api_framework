//
//  Visa.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/15/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import WebKit


//protocol VisaDelegate: class
//{
//    func paymentWithVisa(tel: String)
//}

class Visa: UIView, WKNavigationDelegate, WKUIDelegate
{
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

    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        
        self.addSubview(webView)

        webView.allowsBackForwardNavigationGestures = true
        
        if #available(iOS 11.0, *)
        {
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
            ])
        }
        else
        {
            // Fallback on earlier versions
        }
        
        customActivityIndicatory(theIframe.view, startAnimate: true)
        webView.load(URLRequest(url: URL(string: AppConstant.payment_url)!))

    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.addSubview(webView)

        webView.allowsBackForwardNavigationGestures = true
        
        if #available(iOS 11.0, *)
        {
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor)
            ])
        }
        else
        {
            // Fallback on earlier versions
        }
        webView.load(URLRequest(url: URL(string: AppConstant.payment_url)!))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        print("finish to load")
        

        customActivityIndicatory(theIframe.view, startAnimate: false)
        if let url = webView.url?.absoluteString
        {
            print("url = \(url)")
        }
    }
    
//    override func layoutSubviews()
//    {
//        super.layoutSubviews()
//        
//        telTextField.layer.borderColor = UIColor.blue.cgColor
//        telTextField.layer.borderWidth = 0.5
//        telTextField.layer.cornerRadius = 3
//        
//        telTextField.addRightView(image: UIImage(systemName: "phone.fill")!)
//        
//        telTextField.sizeToFit()
//    }

}


//if #available(iOS 10.0, *)
//        {
//            let url = URL(string: AppConstant.payment_url)
////            UIApplication.shared.openURL(url!)
//
//            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
//        }
//        else
//        {
//            let url = URL(string: AppConstant.payment_url)
//
//            UIApplication.shared.openURL(url!)
//        }
