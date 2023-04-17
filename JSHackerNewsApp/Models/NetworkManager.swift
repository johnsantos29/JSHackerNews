//
//  NetworkManager.swift
//  JSHackerNewsApp
//
//  Created by John Erick Santos on 9/4/2023.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [HackerNewsSinglePost]()

    func fetchData() {
        if let url = URL(string: K.HackerNews.currentStoriesInFrontPageUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error == nil {
                    let decoder = JSONDecoder()

                    if let safeData = data {
                        do {
                            let results = try decoder.decode(HackerNewsData.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            // TODO: do something when it fails
                            print(error)
                        }
                    }
                }
            }

            task.resume()
        }
    }
}
