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
    var hasImage: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPostContent()
    }

    
    func setupPostContent() {
        authorLabel.text = post?.author
        postContentLabel.text = post?.title
        
        if let post = post, let url = URL(string: post.thumbnail), UIApplication.shared.canOpenURL(url) {
            thumbnailImageView.load(url: url)
        } else {
            hasImage = false
            thumbnailImageView.image = UIImage(named: "imagePlaceholder")
            thumbnailImageView.image = thumbnailImageView.image?.withRenderingMode(.alwaysTemplate)
            thumbnailImageView.tintColor = UIColor(red: 235/255, green: 85/255, blue: 40/255, alpha: 1)
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        if let image = thumbnailImageView.image, hasImage {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
        }
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        let alert = UIAlertController(title: nil, message: "Image saved in Photo Library", preferredStyle: .alert)

        present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alert.dismiss(animated: true)
        }
    }
}
