//
//  LoginViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 27.03.2023..
//

import Foundation
import UIKit
import PureLayout

class LoginViewController: UIViewController {
    private var signinButton: UIButton!
    private var signinLabel: UILabel!
    private var emailText : UITextField!
    private var emailLable : UILabel!
    private var passwordLable : UILabel!
    
    private var passwordText: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    private func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    private func createViews() {
        signinLabel = UILabel()
        view.addSubview(signinLabel)
        signinLabel.text = "Sign In"
        
        signinButton = UIButton()
        view.addSubview(signinButton)
        signinButton.setTitle("Sign In", for: .normal)
        
        
        emailLable = UILabel()
        view.addSubview(emailLable)
        emailLable.text = "Email adress"
        
        emailText = TextField()
        view.addSubview(emailText)
        emailText.text = "ex. Matt@iosCourse.com"
        
        
        passwordLable = UILabel()
        view.addSubview(passwordLable)
        passwordLable.text = "Password"
        
        passwordText = TextField()
        view.addSubview(passwordText)
        passwordText.text = "Enter your password"
        
        
    }
    
    private func styleViews() {
        
        UIFont.familyNames.forEach({familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName,fontNames)
        })
        
        view.backgroundColor = UIColor(hex: 0x0B253F)
        
        signinLabel.textColor = .white
        signinLabel.font = UIFont(name: "ProximaNova-Bold", size: 24)
        
        signinButton.backgroundColor = UIColor(hex: 0x4CB2DF)
        
        emailLable.textColor = .white
        
        emailText.layer.cornerRadius = 10
        emailText.textColor = UIColor(hex: 0x4CB2DF)
        emailText.backgroundColor = UIColor(hex: 0x133B63)
        emailText.layer.borderWidth = 1
        emailText.layer.borderColor = UIColor(hex: 0x4CB2DF).cgColor
        
        passwordLable.textColor = .white
        
        passwordText.layer.cornerRadius = 10
        passwordText.borderStyle = UITextField.BorderStyle.roundedRect
        passwordText.textColor = UIColor(hex: 0x4CB2DF)
        passwordText.backgroundColor = UIColor(hex: 0x133B63)
        passwordText.layer.borderWidth = 1
        passwordText.layer.borderColor = UIColor(hex: 0x4CB2DF).cgColor
        
        signinButton.titleLabel?.font =  UIFont(name:  "ProximaNova-Bold", size: 14)
        signinButton.backgroundColor =  UIColor(hex: 0x4CB2DF)
        signinButton.layer.cornerRadius = 10
        signinButton.contentEdgeInsets = UIEdgeInsets.init(top: 10, left: 24, bottom: 10, right: 24)
            
            
        }
        
        private func defineLayoutForViews() {
            signinLabel.autoPinEdge(toSuperviewSafeArea: .top, withInset: 48)
            signinLabel.autoAlignAxis(.vertical, toSameAxisOf: view)
            
            emailLable.autoPinEdge(.top, to: .bottom, of: signinLabel, withOffset: 48)
            emailLable.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
            
            emailText.autoPinEdge(.top, to: .bottom, of: emailLable, withOffset: 8)
            emailText.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
            emailText.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16)
            
            passwordLable.autoPinEdge(.top, to: .bottom, of: emailText, withOffset: 24)
            passwordLable.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
            
            passwordText.autoPinEdge(.top, to: .bottom, of: passwordLable, withOffset: 8)
            passwordText.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
            passwordText.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16)
            
    
            signinButton.autoPinEdge(.top, to: .bottom, of: passwordText, withOffset: 48)
            signinButton.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 32)
            signinButton.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 32)
            
        }
    }

    
    extension UIColor {
        
        convenience init(hex:Int, alpha: CGFloat = 1.0) {
            self.init(
                red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
                blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
                alpha: alpha
            )
        }
        
    }
    
    class TextField: UITextField {
        
        let padding = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        
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
    

