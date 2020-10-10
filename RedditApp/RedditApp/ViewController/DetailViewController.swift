//
//  DetailViewController.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var postContentLabel: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPostContent()
    }

    
    func setupPostContent() {
        authorLabel.text = post?.author
        postContentLabel.text = post?.title
        
        if let post = self.post, let url = URL(string: post.thumbnail) {
            thumbnailImageView.load(url: url)
        }
    }
}
