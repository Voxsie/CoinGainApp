//
//  FirstModuleTest.swift
//  MVPHomeWorkTests
//
//  Created by Илья Желтиков on 04.06.2022.
//

import XCTest
@testable import MVPHomeWork

class MockView: FirstViewProtocol {
    
    var titleTest: String?
    
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class FirstModuleTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: FirstPresenter!
    
    override func setUp() {
        view = MockView()
        //Baz Bar Foo - тестовые "имена"
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = FirstPresenter(view: view, person: person)
    }
    
    override func tearDown() {
        view = nil
        person = nil
        presenter = nil
    }
    
    func ModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "view is not nil")
        XCTAssertNotNil(presenter, "view is not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar" )
    }
    
    // проверка на сет
    func testPerson() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
//
//        XCTAssertEqual(person.firstName, "Baz")
//        XCTAssertEqual(person.lastName, "Baz")
    }
}
