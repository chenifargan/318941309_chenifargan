//
//  SignUpViewController.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 26/06/2022.
//

import UIKit
import FirebaseAuth
import Firebase


class SignUpViewController: UIViewController {

    private let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Sign Up"
        label.textColor = .white
        
        label.font = .systemFont(ofSize: 26,weight: .bold)
        return label
        
    }()
    
    private let firstName : UITextField = {
        let name = UITextField()
        name.layer.cornerRadius = 10
        let redPlaceholderText = NSAttributedString(string: " First Name",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        name.attributedPlaceholder = redPlaceholderText
        name.textColor = UIColor.white
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor.white.cgColor
        return name
        
    }()
    private let lastName : UITextField = {
        let lastname = UITextField()
        lastname.layer.cornerRadius = 10
        let redPlaceholderText = NSAttributedString(string: " Last Name",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        lastname.attributedPlaceholder = redPlaceholderText
        lastname.textColor = .white
        lastname.layer.borderWidth = 1
        lastname.layer.borderColor = UIColor.white.cgColor
        return lastname
        
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
        let redPlaceholderText = NSAttributedString(string: " Password",
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordField.attributedPlaceholder = redPlaceholderText
        passwordField.textColor = .white
        passwordField.layer.cornerRadius = 10

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
        button.setTitle("Creat User", for: .normal)
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
        view.addSubview(firstName)
        view.addSubview(lastName)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.addSubview(errorLabel)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        
    }
    func validateFields() -> String? {
        //if empty
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        let pass = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(pass) == false  {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        
        return nil
    }
    @objc func didTapButton() {
        let error = validateFields()
        if error != nil {
            //show error messagw
            showError(error!)
        }
        else{

            let firstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result,err) in
                if  err != nil {
                    self.showError("Error creating user")
                }
                else {
                    let db =  Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": firstName, "lastname" : lastName,"uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }


                    self.transitionToHome()
                }


            }
        }

    }
    func transitionToHome()  {
        
//        let homeViewController = storyboard?.instantiateViewController(identifier:"MainTabBarViewController" ) as? MainTabBarViewController
//
        view.window?.rootViewController = MainTabBarViewController()
       // view.window?.makeKeyAndVisible()
    }
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0,
                             y: 100,
                             width: view.frame.size.width,
                             height: 80)
        firstName.frame = CGRect(x:20,
                                 y:label.frame.origin.y + label.frame.size.height+10,
                                 width: view.frame.size.width-40,
                                 height: 50)
        lastName.frame = CGRect(x:20,
                                 y:firstName.frame.origin.y + firstName.frame.size.height+10,
                                 width: view.frame.size.width-40,
                                 height: 50)
        emailField.frame = CGRect(x: 20,
                                  y: lastName.frame.origin.y + lastName.frame.size.height+10,
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

        errorLabel.frame = CGRect(x: 20,
                              y: button.frame.origin.y + button.frame.size.height+50,
                              width: view.frame.size.width-40,
                              height: 80)
        
        
        
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
