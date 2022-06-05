//
//  FirstModuleTest.swift
//  MVPHomeWorkTests
//
//  Created by Илья Желтиков on 04.06.2022.
//

import XCTest
@testable import MVPHomeWork

class MockView: FirstViewProtocol {
    
    func success() {
        return
    }
    
    func failure(error: Error) {
        return
    }
    
    
    var titleTest: String?
    
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class FirstModuleTest: XCTestCase {
    
    var view: MockView!
    var presenter: FirstPresenter!
    
    override func setUp() {
        view = MockView()
        //Baz Bar Foo - тестовые "имена"
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
    }
    
    func ModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(presenter, "view is not nil")
    }
    
    func testView() {
    }
    
//    // проверка на сет
//    func testPerson() {
//        XCTAssertEqual(person.firstName, "Baz")
//        XCTAssertEqual(person.lastName, "Bar")
////
////        XCTAssertEqual(person.firstName, "Baz")
////        XCTAssertEqual(person.lastName, "Baz")
//    }
}
