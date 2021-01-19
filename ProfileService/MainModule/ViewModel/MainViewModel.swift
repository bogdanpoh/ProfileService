//
//  MainViewModel.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import Foundation

protocol MainViewModelInput {
    func fetchUser(of id: Int)
}

protocol MainViewModelOutput {
    var updateViewData: ((UserModel) -> ())? { get set }
}

typealias MainViewModelProtocol = MainViewModelInput & MainViewModelOutput

final class MainViewModel: MainViewModelProtocol {

    var updateViewData: ((UserModel) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    func fetchUser(of id: Int) {
        
        DispatchQueue.main.async { [weak self] in
            
            // fetched data with network service
            
            self?.updateViewData?(.success(UserModel.User(id: "12457674",
                                                          accountType: "createor",
                                                          mediaCount: 30,
                                                          username: "bogdan.poh",
                                                          media: UserModel.MediaDataResponse(data: [UserModel.DataResponse(id: "12123156578585"), UserModel.DataResponse(id: "1245236347675")]))))
            
        }
        
    }
    
}
