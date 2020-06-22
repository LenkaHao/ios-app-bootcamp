//
//  WeatherManager.swift
//  Clima
//
//  Created by Lenka Hao on 6/20/20.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    
    let baseRequest = "https://api.openweathermap.org/data/2.5/weather?appid=<yourApiId>&units=metric"
    
    func fetchWeather(_ city: String) {
        let cityRequest = city.replacingOccurrences(of: " ", with: "%20")
        let request = "\(baseRequest)&q=\(cityRequest)"
        getResponse(with: request)
        
    }
    
    func fetchWeather(lat: Double, lon: Double) {
        let request = "\(baseRequest)&lat=\(lat)&lon=\(lon)"
        getResponse(with: request)
    }
    
    func getResponse(with request: String) {
        if let url = URL(string: request) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseResponse(safeData) {
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseResponse(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(WeatherDataModel.self, from: weatherData)
            let weather = WeatherModel(conditionId: decoded.weather[0].id, city: decoded.name, temperature: decoded.main.temp)
            return weather
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
