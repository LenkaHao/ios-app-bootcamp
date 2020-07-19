//
//  ContentView.swift
//  H4X0R News
//
//  Created by Lenka Hao on 7/19/20.
//  Copyright © 2020 Lenka Hao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkModel = NetworkModel()
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 4
        return formatter
    }
    
    var body: some View {
        NavigationView {
            List(networkModel.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(self.numberFormatter.string(from: NSNumber(value: post.points))!)
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            self.networkModel.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
