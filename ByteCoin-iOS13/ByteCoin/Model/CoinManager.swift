//
//  CoinManager.swift
//  ByteCoin
//
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(coinManager: CoinManager, priceModel: PriceModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR-API-KEY-HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let request = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        getResponse(with: request)
    }
    
    func getResponse(with request: String) {
        if let url = URL(string: request) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let priceModel = self.parseResponse(safeData) {
                        self.delegate?.didUpdatePrice(coinManager: self, priceModel: priceModel)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseResponse(_ priceData: Data) -> PriceModel? {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(PriceDataModel.self, from: priceData)
            return PriceModel(currency: decoded.asset_id_quote, price: decoded.rate)
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
