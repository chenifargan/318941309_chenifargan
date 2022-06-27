//
//  HeroHeaderUIView.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 24/05/2022.
//

import UIKit

class HeroHeaderUIView: UIView {

    private let downloadsButton : UIButton = {
        let button = UIButton()
         button.setTitle("Download", for: .normal)
         button.layer.borderColor = UIColor.white.cgColor
         button.layer.borderWidth = 1
         button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
         return button
        
        
    }()
    
    
    
    private let playButton : UIButton = {
       let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10

        return button
    }()
    
    
    private let heroImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "twilightImage")
        return imageView
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ UIColor.clear.cgColor,UIColor.systemBackground.cgColor]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
    }
    private func applyConstrains (){
        let playButtonConstrains = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 90)
            ]
        let downloadButtonConstraints = [
        
            downloadsButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -70),
            downloadsButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
            downloadsButton.widthAnchor.constraint(equalToConstant: 90)

        
        
        ]
        NSLayoutConstraint.activate(playButtonConstrains)
        NSLayoutConstraint.activate(downloadButtonConstraints)

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadsButton)
        applyConstrains()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    public func configure(with model : TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        heroImageView.sd_setImage(with: url,completed: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
