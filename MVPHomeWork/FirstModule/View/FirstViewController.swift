//
//  FirstViewController.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 04.06.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: FirstViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didContinueButton(_ sender: Any) {
        self.presenter.showGreeting()
    }
}

//Binding
extension FirstViewController: FirstViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
