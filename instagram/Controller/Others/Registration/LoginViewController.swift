//
//  LoginViewController.swift
//  instagram
//
//  Created by Abdallah Ehab on 15/02/2022.
//

import UIKit
import SafariServices
struct Constant{
    static let cornerRadius = 8.0
}
class LoginViewController: UIViewController {

    
    private let usernameEmailField : UITextField = {
       let field = UITextField()
        field.placeholder = "User Name Or Email"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constant.cornerRadius
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        return field
    }()
    
    private let passwordField : UITextField = {
        var field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constant.cornerRadius
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        return field
    }()
    
    private let loginButton : UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = Constant.cornerRadius
        
        return button
    }()
    
    private let termsButton : UIButton = {
       let button = UIButton()
        button.setTitle("Tetms Of services", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let privacyButton  : UIButton = {
       let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let creatAccountButton : UIButton = {
       let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User ? create an Account", for: .normal)
        return button
    }()

    private let logoView : UIView = {
       let logo = UIView()
        let backgraoundImage = UIImageView(image: UIImage(named: "a"))
        logo.addSubview(backgraoundImage)
        return logo
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameEmailField.delegate = self
        passwordField.delegate = self
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termsButtonpressd), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(privacyButtonpressd), for:  .touchUpInside)
        creatAccountButton.addTarget(self, action: #selector(creatAccountButtonpressd), for: .touchUpInside)
        view.backgroundColor = .systemBackground
        subViews()
    }
    override func viewDidLayoutSubviews() {
        // add frames to all ui Componnet that just Created button ,text....etc
        
        logoView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width,
            height: view.height/3)
        usernameEmailField.frame = CGRect(
            x: 25,
            y: logoView.bottom+50,
            width:view.width-50 ,
            height: 55
        )
        passwordField.frame = CGRect(
            x:25,
            y: usernameEmailField.bottom+10 ,
            width:view.width-50 ,
            height: 55)
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom+10,
            width: view.width-50,
            height: 55)
        
        creatAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom+10,
            width: view.width-50,
            height: 55)
        termsButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom-100,
            width: view.width-20,
            height: 55)
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height-view.safeAreaInsets.bottom-50,
            width: view.width-20,
            height: 55)

        ConfigureHeaderViewAndLogo()
    }
    
    private func subViews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(creatAccountButton)
        view.addSubview(logoView)
    }
    
    private func ConfigureHeaderViewAndLogo(){
        guard  logoView.subviews.count == 1 else{
            return
        }
        guard let backgraoundImage = logoView.subviews.first else{
            return
        }
        backgraoundImage.frame = logoView.bounds
        
        // you can do that without any gurd but use guard to be be more prof
//        let backgraoundImage = UIImageView(image: UIImage(named: "gradint"))
//        backgraoundImage.frame = logoView.bounds
//        logoView.addSubview(backgraoundImage)
        
        let imageLogoText = UIImageView(image:UIImage(named: "textLogo"))
        imageLogoText.contentMode = .scaleAspectFit
        imageLogoText.frame = CGRect(x: logoView.width/4, y: view.safeAreaInsets.top, width: logoView.width/1.5, height: logoView.height - view.safeAreaInsets.top)
        logoView.addSubview(imageLogoText)
        print( logoView.width)
        print( view.safeAreaInsets.top)
        print( logoView.width)
        print( logoView.height)

     
    }
    
    
    @objc private func loginButtonPressed(){
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text , !usernameEmail.isEmpty ,
        let password = passwordField.text , password.count >= 8
        else{
            // if any condition not achived breake from the hole function
            return
        }
        // if gurd condition achived excuute the next
        
        //add login functuinality
        
    }
    @objc private func termsButtonpressd(){
        if let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") {
         let termsVc = SFSafariViewController(url: url)
            present(termsVc, animated: true, completion: nil)
        }else {
            return
        }
    }
    @objc private func privacyButtonpressd(){
        if let url = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0"){
            let privacyVc = SFSafariViewController(url: url)
            present(privacyVc, animated: true, completion: nil)
        }
    }
    @objc private func creatAccountButtonpressd(){
        let vc = RegistrationViewController()
        present(vc, animated: true, completion: nil)
    }

}



extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            loginButtonPressed()
        }
        return true
    }
}
