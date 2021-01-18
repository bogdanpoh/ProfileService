//
//  MainView.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import UIKit

class MainView: UIView {
    
    // MARK: - UI
    
    var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()
    
    var nickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

private extension MainView {
    
    func setupViews() {
        addSubview(avatarImage)
        addSubview(nickNameLabel)
    }
    
    func configureConstraints() {
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor),
            avatarImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nickNameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
            nickNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
