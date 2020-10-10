//
//  ViewController.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var postsArray: [Post]?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let service = Service()
        
        service.getPosts { (posts) in
            self.postsArray = posts
        }
    }


}

