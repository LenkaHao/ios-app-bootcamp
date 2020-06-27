//
//  PriceDataModel.swift
//  ByteCoin
//
//  Created by Lenka Hao on 6/27/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct PriceDataModel: Decodable {
    let rate: Double
    let asset_id_quote: String
}
