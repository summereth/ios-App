//
//  NetworkingManager.swift
//  H4X0R News
//
//  Created by 李茜 on 9/30/23.
//

import Foundation

class NetworkingManager: ObservableObject {
    
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if (error == nil) {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let decodedData = try decoder.decode(PostData.self, from: safeData)
                            self.posts = decodedData.hits
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
