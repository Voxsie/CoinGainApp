//
//  FirstViewController.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 04.06.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FirstViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cryptoCoins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
        let cryptocoin = presenter.cryptoCoins?[indexPath.row]
        if let coinCell = cell as? CustomTableViewCell {
            coinCell.titleLabel.text = "\(cryptocoin?.coinName ?? "") (\(cryptocoin?.symbol ?? ""))"
            coinCell.logoImageView.load(urlString: cryptocoin?.logo ?? "")
            coinCell.oneHourChangeLabel.text = cryptocoin?.oneHChange
            let oneHourChange = cryptocoin?.oneHChange ?? "-"
            if oneHourChange[0] == "-" {
                coinCell.priceLabel.textColor = .red
                coinCell.oneHourChangeLabel.textColor = .red
            }
            else if (oneHourChange == "0.0%" || oneHourChange == "-0.0%") {
                coinCell.priceLabel.textColor = .label
                coinCell.oneHourChangeLabel.textColor = .label
            }
            else {
                coinCell.priceLabel.textColor = .green
                coinCell.oneHourChangeLabel.textColor = .green
            }
            coinCell.priceLabel.text = cryptocoin?.price
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cryptocoin = presenter.cryptoCoins?[indexPath.row]
        let secondViewController = ModuleBuilder.createSecondModule(cryptocoin: cryptocoin)
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}


//Binding
extension FirstViewController: FirstViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        showAlertWith(title: "Ошибка", message: "Проверьте соединение с интернетом")
    }
}

extension StringProtocol {
subscript(offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }
}

extension UIViewController {
    func showAlertWith(title: String, message: String){
        //Creating alert
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")}))
        
        alert.message = message
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
