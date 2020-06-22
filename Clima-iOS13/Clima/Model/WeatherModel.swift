//
//  WeatherModel.swift
//  Clima
//
//  Created by Lenka Hao on 6/21/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let city: String
    let temperature: Double
    
    var conditionName: String {
        return getWeatherConditionName(conditionId: self.conditionId)
    }
    var temperatureString: String {
        return String(format: "%.0f", self.temperature)
    }
    
    func getWeatherConditionName(conditionId: Int) -> String {
        switch conditionId {
        case 200...299:
            return "cloud.bolt"
        case 300...399:
            return "cloud.drizzle"
        case 500...599:
            return "cloud.rain"
        case 600...699:
            return "cloud.snow"
        case 700...799:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...899:
            return "cloud"
        default:
            return "cloud"
        }
    }
}
