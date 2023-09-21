//
//  CoinManager.swift
//  ByteCoin
//
//  Created by 李茜 on 20/9/23.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ coinData: CoinData)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "BB330549-49DD-4779-8BCF-8A3B8DBD9A9A"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?&apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlStr: String) {

        // 1. create a URL
        if let url = URL(string: urlStr) {
            // 2. create a session
            let session = URLSession(configuration: .default)
            // 3. create a task
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    if let coinData = parseJSON(safeData) {
                        self.delegate?.didUpdateCurrency(coinData)
                    }
                }
            }
            // 4. start the task
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinData?{
        let decoder = JSONDecoder()
        do {
            let decodedCoinData = try decoder.decode(CoinData.self, from: data)
            
            return decodedCoinData
        } catch {
            print(error)
            return nil
        }
        
    }
}
