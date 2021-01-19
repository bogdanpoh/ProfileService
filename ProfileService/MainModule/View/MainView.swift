//
//  MainView.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - Public
    
    var userModel: UserModel = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
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
    
    // MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch userModel {
        
        case .initial:
            updateView(user: nil, isHidden: true)
            
        case .loading:
            updateView(user: nil, isHidden: true)
        
        case .failure:
            updateView(user: nil, isHidden: true)
            
        case .success(let user):
            updateView(user: user, isHidden: false)
            
        }
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

// MARK: - Update

private extension MainView {
    
    func updateView(user: UserModel.User?, isHidden: Bool) {
        nickNameLabel.text = user?.username
        nickNameLabel.isHidden = isHidden
        

        if let firstImageId = user?.media.data.first {
            
        } else {
            
        }
        
        avatarImage.isHidden = isHidden
    }
    
}
