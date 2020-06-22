//
//  WeatherData.swift
//  Clima
//
//  Created by Lenka Hao on 6/21/20.
//

import Foundation

struct WeatherDataModel: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}
