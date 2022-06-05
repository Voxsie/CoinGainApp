//
//  FirstPresenter.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 04.06.2022.
//

import Foundation

// FirstViewProtocol - SOLI(D) - Абстрагируемся
protocol FirstViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

// Используем несколько протоков - SOL(I)D - Лучше несколько интерфейсов, чем один громоздский
protocol FirstViewPresenterProtocol: AnyObject {
    init(view: FirstViewProtocol, networkService: NetworkServiceProtocol)
    func getCryptocoins()
    var cryptoCoins: [Cryptocoin]? {get set}
}

class FirstPresenter: FirstViewPresenterProtocol {
    weak var view: FirstViewProtocol?
    let networkService: NetworkServiceProtocol!
    var cryptoCoins: [Cryptocoin]?
    
    required init(view: FirstViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getCryptocoins()
    }
    
    func getCryptocoins() {
        networkService.getCryptocoins { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print(response)
                    self.cryptoCoins = response?.result
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
