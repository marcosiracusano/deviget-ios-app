//
//  Dao.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation

class Dao {
    
    func getPosts(params: String?, DaoCompleted: @escaping (Dto) -> Void) {
        let session = URLSession.shared
        var url = URL(string: "https://www.reddit.com/top.json")!
        
        if let params = params, let urlWithParams = url.withAfterParam(params) {
            url = urlWithParams
        }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            print(response ?? "")

            if error != nil {
                print(error ?? "")
                return
            }
            
            do {
                let dto = try JSONDecoder().decode(Dto.self, from: data!)
                
                print(dto)
                DaoCompleted(dto)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()
    }
}

extension URL {
    func withAfterParam(_ after: String) -> URL? {

        var authorizedURL: URL? = self
        let after = after
        let afterQI = URLQueryItem(name: "after", value: after)
        var components = URLComponents(string: absoluteString)
        var queryItems: [URLQueryItem] = []
        if let mutable = components?.queryItems {
            queryItems = mutable
        }
        queryItems.append(afterQI)
        components?.queryItems = queryItems
        authorizedURL = components?.url
        return authorizedURL
    }
}
