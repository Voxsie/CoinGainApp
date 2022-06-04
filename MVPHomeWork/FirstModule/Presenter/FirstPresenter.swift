//
//  FirstPresenter.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 04.06.2022.
//

import Foundation

// FirstViewProtocol - SOLI(D) - Абстрагируемся
protocol FirstViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

// Используем несколько протоков - SOL(I)D - Лучше несколько интерфейсов, чем один громоздский
protocol FirstViewPresenterProtocol: AnyObject {
    init(view: FirstViewProtocol, person: Person)
    func showGreeting()
}

class FirstPresenter: FirstViewPresenterProtocol {
    
    let view: FirstViewProtocol
    let person: Person
    
    required init(view: FirstViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = (self.person.firstName ?? "") + " " + (self.person.lastName ?? "")
        self.view.setGreeting(greeting: greeting)
    }
    
    
}
