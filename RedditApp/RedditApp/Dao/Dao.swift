//
//  Dao.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation

class Dao {
    
    func getPosts(DaoCompleted: @escaping (Dto) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "https://www.reddit.com/top.json")!
        
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
