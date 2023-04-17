//
//  HackerNewsData.swift
//  JSHackerNewsApp
//
//  Created by John Erick Santos on 9/4/2023.
//

import Foundation

struct HackerNewsData: Decodable {
    let hits: [HackerNewsSinglePost]
}

struct HackerNewsSinglePost: Decodable, Identifiable {
    var id: String {
        return objectID
    }

    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
