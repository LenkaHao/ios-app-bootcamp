//
//  PriceModel.swift
//  ByteCoin
//
//  Created by Lenka Hao on 6/27/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct PriceModel {
    let currency: String
    let price: Double
    
    var priceString: String {
        return String(format: "%.2f", price)
    }
}
