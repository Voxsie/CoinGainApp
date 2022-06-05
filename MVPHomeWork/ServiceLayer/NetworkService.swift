//
//  NetworkService.swift
//  MVPHomeWork
//
//  Created by Илья Желтиков on 05.06.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCryptocoins(completion: @escaping (Result<CryptoResponse?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getCryptocoins(completion: @escaping (Result<CryptoResponse?, Error>) -> Void) {
        
        let headers = [
            "X-RapidAPI-Host": "live-crypto-prices.p.rapidapi.com",
            "X-RapidAPI-Key": "772173cc0dmshed155ddcb21e45dp138a65jsn0b4bd78cdf88"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://live-crypto-prices.p.rapidapi.com/pricefeed")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            print(response)
            if (error != nil) {
                print(error)
                completion(.failure(error!))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode(CryptoResponse?.self, from: data!)
                print("obj:")
                print(obj)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        })
        dataTask.resume()
    }
}
