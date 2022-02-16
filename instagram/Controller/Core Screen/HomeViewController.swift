//
//  ViewController.swift
//  instagram
//
//  Created by Abdallah Ehab on 15/02/2022.
//

import UIKit
import Firebase
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleLoginStatus()
    }

    private func handleLoginStatus(){
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true)
        }
    }
    
    

}

