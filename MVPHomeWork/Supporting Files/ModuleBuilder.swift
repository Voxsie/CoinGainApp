//
//  ModuleBuilder.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 04.06.2022.
//

import UIKit

protocol Builder {
    static func createModule() -> UIViewController
}

//DI - Внедрение зависимостей, то есть они создаются не внутри этих сущностей, а снаружи, а потом инжектятся

class ModuleBuilder: Builder {
    static func createModule() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blaine")
        let view = FirstViewController()
        let presenter = FirstPresenter(view: view, person: model)
        view.presenter = presenter
        
        return view
    }
    
    
}
