//
//  SecondPresenter.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 05.06.2022.
//

import Foundation


//MARK: - Input, Output protocols

protocol SecondViewProtocol: AnyObject {
    func setCryptocoin(cryptocoin: Cryptocoin?)
}

protocol SecondViewPresenterProtocol: AnyObject {
    init(view: SecondViewProtocol, networkService: NetworkService, cryptocoin: Cryptocoin?)
    func setCryptocoin()
}

class SecondPresenter: SecondViewPresenterProtocol {
    weak var view: SecondViewProtocol?
    let networkService: NetworkServiceProtocol!
    var cryptocoin: Cryptocoin?
    
    required init(view: SecondViewProtocol, networkService: NetworkService, cryptocoin: Cryptocoin?) {
        self.view = view
        self.networkService = networkService
        self.cryptocoin = cryptocoin
    }
    

    
    public func setCryptocoin() {
        self.view?.setCryptocoin(cryptocoin: cryptocoin)
    }
}

