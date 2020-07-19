//
//  NetworkModel.swift
//  H4X0R News
//
//  Created by Lenka Hao on 7/19/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import Foundation

class NetworkModel: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let safeData = data {
                        if let postDataModel = self.parseResponse(safeData) {
                            DispatchQueue.main.async {
                                self.posts = postDataModel.hits
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseResponse(_ postData: Data) -> PostDataModel? {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(PostDataModel.self, from: postData)
            return decoded
        } catch {
            print(error)
            return nil
        }
    }
}
