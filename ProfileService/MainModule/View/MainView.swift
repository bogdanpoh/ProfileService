//
//  MainView.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - UI
    
    let avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()
    
    let nickNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Username"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        configureConstraints()
    }
    
    @available (*, unavailable)
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
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor),
            avatarImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            avatarImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            nickNameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
            nickNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
