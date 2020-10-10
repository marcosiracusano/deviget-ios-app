//
//  ViewController.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dao = Dao()
        dao.getPosts()
    }


}

