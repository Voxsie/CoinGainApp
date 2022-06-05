//
//  ModuleBuilder.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 04.06.2022.
//

import UIKit

protocol Builder {
    static func createModule() -> UIViewController
    static func createSecondModule(cryptocoin: Cryptocoin?) -> UIViewController
}

//DI - Внедрение зависимостей, то есть они создаются не внутри этих сущностей, а снаружи, а потом инжектятся

class ModuleBuilder: Builder {
    static func createModule() -> UIViewController {
        let view = FirstViewController()
        let networkService = NetworkService()
        let presenter = FirstPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
    
    static func createSecondModule(cryptocoin: Cryptocoin?) -> UIViewController {
        let view = SecondViewController()
        let networkService = NetworkService()
        let presenter = SecondPresenter(view: view, networkService: networkService, cryptocoin: cryptocoin)
        view.presenter = presenter
        
        return view
    }
}
