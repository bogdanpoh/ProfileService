//
//  MainViewModel.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import Foundation

protocol MainViewModelInput {
    func viewDidLoad()
    func fetchUser(of id: Int)
}

protocol MainViewModelOutput {
    var updateViewData: ((UserModel) -> ())? { get set }
}

typealias MainViewModelProtocol = MainViewModelInput & MainViewModelOutput

// MARK: - MainViewModel

final class MainViewModel {
    var updateViewData: ((UserModel) -> ())?
}

// MARK: - MainViewModelInput

extension MainViewModel: MainViewModelInput  {
    
    func viewDidLoad() {
        updateViewData?(.initial)
    }

    func fetchUser(of id: Int) {
        DispatchQueue.main.async { [weak self] in
            
            self?.updateViewData?(.success(UserModel.User(id: "12457674",
                                                          accountType: "createor",
                                                          mediaCount: 30,
                                                          username: "bogdan.poh",
                                                          media: UserModel.MediaDataResponse(data: [UserModel.DataResponse(id: "12123156578585"), UserModel.DataResponse(id: "1245236347675")]))))
            
        }
    }
    
}

// MARK: - MainViewOutput

extension MainViewModel: MainViewModelOutput {
    
}
