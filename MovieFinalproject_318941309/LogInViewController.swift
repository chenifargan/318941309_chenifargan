//
//  LogInViewController.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 26/06/2022.
//

import UIKit
import FirebaseAuth
import SwiftUI
class LogInViewController: UIViewController {

    private let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.textColor = .white
        
        label.font = .systemFont(ofSize: 26,weight: .bold)
        return label
        
    }()
    private let emailField : UITextField = {
        let emailField = UITextField()
        emailField.layer.cornerRadius = 10
        let redPlaceholderText = NSAttributedString(string: " Email Address",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailField.attributedPlaceholder = redPlaceholderText

        emailField.textColor = .white
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.white.cgColor
        return emailField
        
    }()
    private let passwordField : UITextField = {
        let passwordField = UITextField()
        passwordField.textColor = .white
        passwordField.layer.cornerRadius = 10
        let redPlaceholderText = NSAttributedString(string: " Password",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordField.attributedPlaceholder = redPlaceholderText

        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.white.cgColor
        return passwordField
        
    }()
    private let button : UIButton = {
        let button = UIButton()
       // button.backgroundColor = .systemGreen
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
       // button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
        
    }()
    private let errorLabel : UILabel = {
        let error = UILabel()
        error.textAlignment = .center
        error.text = "error"
        error.textColor = .white
        error.alpha = 0
        error.numberOfLines = 4
        error.font = .systemFont(ofSize: 14,weight: .bold)
        return error
        
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.addSubview(errorLabel)

        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0,
                             y: 100,
                             width: view.frame.size.width,
                             height: 80)
        
        emailField.frame = CGRect(x: 20,
                                  y: label.frame.origin.y + label.frame.size.height+10,
                                  width: view.frame.size.width-40,
                                  height: 50)
        
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.frame.origin.y + emailField.frame.size.height+10,
                                     width: view.frame.size.width-40,
                                     height: 50)
        button.frame = CGRect(x: 20,
                              y: passwordField.frame.origin.y + passwordField.frame.size.height+50,
                              width: view.frame.size.width-40,
                              height: 80)
        errorLabel.frame = CGRect(x:20,
                                  y: button.frame.origin.y + button.frame.size.height+10,
                                  width: view.frame.size.width - 40,
                                  height: 50)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc private func didTapButton(){
        
        if   emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.errorLabel.text = "Please fill in all fields"
        }
        else{
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) {
            (result,error) in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
             
                self.transitionToHome()
            }
                
        }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    func transitionToHome()  {
        
//        let homeViewController = storyboard?.instantiateViewController(identifier:"MainTabBarViewController" ) as? MainTabBarViewController
//
        view.window?.rootViewController = MainTabBarViewController()
       // view.window?.makeKeyAndVisible()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
