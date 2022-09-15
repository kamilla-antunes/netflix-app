//
//  PosterHeaderView.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 12/09/22.
//

import UIKit

class PosterHeaderView: UIView {
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "posterImage")
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        posterImageView.frame = bounds
    }
    
    private func configure() {
        addSubview(posterImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        setUpContraints()
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            playButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -16),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120),
            
            downloadButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 16),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}
