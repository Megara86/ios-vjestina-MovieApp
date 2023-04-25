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
    private var emailTextField: UITextField!
    private var emailLable: UILabel!
    private var passwordLable: UILabel!
    
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
        
        signinButton = UIButton()
        view.addSubview(signinButton)
        
        emailLable = UILabel()
        view.addSubview(emailLable)
        
        emailTextField = UITextField()
        view.addSubview(emailTextField)
        
        passwordLable = UILabel()
        view.addSubview(passwordLable)
        
        passwordText = UITextField()
        view.addSubview(passwordText)
    }
    
    private func styleViews() {
        view.backgroundColor = UIColor(hex: 0x0B253F)
        
        signinLabel.text = "Sign In"
        signinLabel.textColor = .white
        signinLabel.font = UIFont(name: "ProximaNova-Bold", size: 24)
        
        signinButton.setTitle("Sign In", for: .normal)
        signinButton.backgroundColor = UIColor(hex: 0x4CB2DF)
        
        emailLable.text = "Email adress"
        emailLable.textColor = .white
        
        emailTextField.text = "ex. Matt@iosCourse.com"
        emailTextField.layer.cornerRadius = 10
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.textColor = UIColor(hex: 0x4CB2DF)
        emailTextField.backgroundColor = UIColor(hex: 0x133B63)
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(hex: 0x4CB2DF).cgColor
        
        passwordLable.text = "Password"
        passwordLable.textColor = .white
        
        passwordText.text = "Enter your password"
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
            
            emailTextField.autoPinEdge(.top, to: .bottom, of: emailLable, withOffset: 8)
            emailTextField.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
            emailTextField.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16)
            
            passwordLable.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: 24)
            passwordLable.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
            
            passwordText.autoPinEdge(.top, to: .bottom, of: passwordLable, withOffset: 8)
            passwordText.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
            passwordText.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 16)
            
            signinButton.autoPinEdge(.top, to: .bottom, of: passwordText, withOffset: 48)
            signinButton.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 32)
            signinButton.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 32)
        }
    }
