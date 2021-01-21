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
        
        DefaultThemeProvider.shared.register(observer: self)
        DefaultThemeProvider.shared.setupTheme(traitCollection)
        
        bindToViewModel()
        setupViews()
        configureConstraints()
        
        mainViewModel.viewDidLoad()
        mainViewModel.fetchUser(of: 1234567788)
    }
    
    // MARK: - Override methods
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        DefaultThemeProvider.shared.toggleTheme()
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

// MARK: - Binding To ViewModel

private extension MainViewController {

    func bindToViewModel() {
        mainViewModel.updateViewData = { [weak self] userModel in
            self?.mainView.userModel = userModel
        }
    }

}

// MARK: - Themeable

extension MainViewController: Themeable {
    
    func apply(theme: Theme) {
        view.backgroundColor = theme.colors.backgroundColor
        mainView.set(color: theme.colors.labelColor)
    }
}
