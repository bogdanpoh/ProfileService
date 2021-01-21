//
//  DefaultThemeProvider.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 19.01.2021.
//

import UIKit

final class DefaultThemeProvider {
    static let shared = DefaultThemeProvider()
    var theme: Theme {
        didSet {
            UserDefaults.standard.set(theme.type == .dark, forKey: "isDark")
            notifyObservers()
        }
    }
    
    private init() {
        self.theme = UserDefaults.standard.bool(forKey: "isDark") ? .dark : .light
    }
    
    func toggleTheme() {
        theme = theme.type == .light ? .dark : .light
    }
    
    func setupTheme(_ traitCollection: UITraitCollection)  {
        switch traitCollection.userInterfaceStyle {
        case .unspecified:
            theme = .light
            
        case .light:
            theme = .light
            
        case .dark:
            theme = .dark
            
        @unknown default:
            theme = .light
        }
    }
    
    func register<Observer: Themeable>(observer: Observer) {
        observer.apply(theme: theme)
        observers.add(observer)
    }
    
    private func notifyObservers() {
        DispatchQueue.main.async {
            self.observers.allObjects
                .compactMap{ $0 as? Themeable }
                .forEach{ $0.apply(theme: self.theme) }
        }
    }
    
    // MARK: - Private
    
    private var observers: NSHashTable<AnyObject> = NSHashTable.weakObjects()
}
