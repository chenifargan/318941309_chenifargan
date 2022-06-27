//
//  MainViewController.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 26/06/2022.
//

import UIKit
import AVKit
class MainViewController: UIViewController {
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
    let logInButton : UIButton = {
        let button = UIButton()
         button.setTitle("Log In", for: .normal)
         button.layer.borderColor = UIColor.white.cgColor
         button.layer.borderWidth = 1
         button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
         return button
        
        
    }()
    let SignUpButton : UIButton = {
        let button = UIButton()
         button.setTitle("Sign Up", for: .normal)
         button.layer.borderColor = UIColor.white.cgColor
         button.layer.borderWidth = 1
         button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
         return button
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
       view.addSubview(SignUpButton)
        view.addSubview(logInButton)
        Constraints()
        
        
        SignUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(didTapLogIn), for: .touchUpInside)
        self.view.addSubview(SignUpButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    @objc func didTapSignUp (){
        let vc = SignUpViewController()
        present(vc, animated: true)

        
    }
    
    @objc func didTapLogIn (){
       let vc = LogInViewController()
        present(vc, animated: true)

    }
 
 

    
    
    
    
    func Constraints(){
        let SignUpButtonConstraints = [
            SignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SignUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 540),
            SignUpButton.widthAnchor.constraint(equalToConstant: 140),
            SignUpButton.heightAnchor.constraint(equalToConstant: 40)
        
        ]
        
        let LogInButtonConstraints = [

            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: SignUpButton.bottomAnchor,constant: 40),
            logInButton.widthAnchor.constraint(equalToConstant: 140),
            logInButton.heightAnchor.constraint(equalToConstant: 40)
        
        ]
        NSLayoutConstraint.activate(SignUpButtonConstraints)
        NSLayoutConstraint.activate(LogInButtonConstraints)

        
    }
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    func setUpVideo(){
       let bundelPath = Bundle.main.path(forResource: "movie", ofType: "mp4")
        guard bundelPath != nil else{
            return
        }
        let url = URL(fileURLWithPath: bundelPath!)
        
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
        
    }
}
