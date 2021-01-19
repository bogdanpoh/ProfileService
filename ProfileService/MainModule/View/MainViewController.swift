//
//  ViewController.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private let mainView = MainView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindToViewModel()
        setupViews()
        configureConstraints()

        mainViewModel.viewDidLoad()
        mainViewModel.fetchUser(of: 1234567788)
    }
    
    // MARK: - Private
    
    private var mainViewModel: MainViewModelProtocol = MainViewModel()
    
}

// MARK: - Setup

private extension MainViewController {
    
    func setupViews() {
        view.addSubview(mainView)
    }
    
    func configureConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: - Private Methods

private extension MainViewController {

    func bindToViewModel() {
        mainViewModel.updateViewData = { [weak self] userModel in
            self?.mainView.userModel = userModel
        }
    }

}
