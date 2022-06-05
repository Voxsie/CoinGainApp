//
//  SecondViewController.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 05.06.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var presenter: SecondViewPresenterProtocol!
    var currentCoin: Cryptocoin = Cryptocoin(id: "", logo: "", symbol: "", coinName: "", price: "", oneHChange: "", twFrHChange: "", sevDChange: "", volume24h: "", marketCapital: "", graph: "")
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setCryptocoin()
       

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
    }
}

extension SecondViewController: SecondViewProtocol {
    func setCryptocoin(cryptocoin: Cryptocoin?) {
        self.currentCoin = cryptocoin!
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)
            if let coinCell = cell as? CustomTableViewCell {
                coinCell.titleLabel.text = "\(currentCoin.coinName ?? "") (\(currentCoin.symbol ?? ""))"
                coinCell.logoImageView.load(urlString: currentCoin.logo ?? "")
                coinCell.oneHourChangeLabel.text = currentCoin.oneHChange
                let oneHourChange = currentCoin.oneHChange ?? "-"
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
                coinCell.priceLabel.text = currentCoin.price
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath)
            if let coinCell = cell as? InfoTableViewCell {
                coinCell.titleLabel.text = "Hour Price change"
                coinCell.infoLabel.text = currentCoin.oneHChange
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath)
            if let coinCell = cell as? InfoTableViewCell {
                coinCell.titleLabel.text = "2-Hours Price changes"
                coinCell.infoLabel.text = currentCoin.twFrHChange
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath)
            if let coinCell = cell as? InfoTableViewCell {
                coinCell.titleLabel.text = "7-Days Price changes"
                coinCell.infoLabel.text = currentCoin.sevDChange
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath)
            if let coinCell = cell as? InfoTableViewCell {
                coinCell.titleLabel.text = "24-Hours Volume"
                coinCell.infoLabel.text = currentCoin.volume24h
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath)
            if let coinCell = cell as? InfoTableViewCell {
                coinCell.titleLabel.text = "Market Capitalization"
                coinCell.infoLabel.text = currentCoin.marketCapital
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath)
            if let coinCell = cell as? InfoTableViewCell {
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
}
