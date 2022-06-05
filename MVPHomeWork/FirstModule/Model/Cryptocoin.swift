//
//  Cryptocoin.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 05.06.2022.
//

import Foundation

struct Cryptocoin: Codable {
    let id: String?
    let logo: String?
    let symbol: String?
    let coinName: String?
    let price: String?
    let oneHChange: String?
    let twFrHChange: String?
    let sevDChange: String?
    let volume24h: String?
    let marketCapital: String?
    let graph: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case logo = "Logo"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case price = "Price"
        case oneHChange = "OneHChange"
        case twFrHChange = "TwFrHChange"
        case sevDChange = "SevDChange"
        case volume24h = "Volume24h"
        case marketCapital = "MarketCapital"
        case graph = "Graph"
    }
}


