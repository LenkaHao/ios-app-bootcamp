//
//  PostModel.swift
//  H4X0R News
//
//  Created by Lenka Hao on 7/19/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import Foundation

struct PostDataModel: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
