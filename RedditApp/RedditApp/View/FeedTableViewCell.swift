//
//  FeedTableViewCell.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import UIKit

protocol Dismissable {
    func dismissPost(_ post: Post)
}

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var readIndicatorView: UIView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var entryDateLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissButtonView: UIView!
    @IBOutlet weak var dismissButtonImageView: UIImageView!
    @IBOutlet weak var dismissButtonLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    var post: Post?
    var delegate: Dismissable?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        dismissButtonView.addGestureRecognizer(tap)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            readIndicatorView.backgroundColor = .none
        }
    }
 
    
    func setupView() {

        dismissButtonImageView.image = dismissButtonImageView.image?.withRenderingMode(.alwaysTemplate)
        dismissButtonImageView.tintColor = UIColor(red: 235/255, green: 85/255, blue: 40/255, alpha: 1)
        
        readIndicatorView.layer.cornerRadius = readIndicatorView.layer.frame.height / 2
    }
    
    func setupContent(with post: Post) {
        self.post = post
        titleLabel.text = post.title
        authorLabel.text = post.author
        entryDateLabel.text = getEntryDate(from: post.created)
        commentsLabel.text = "\(post.numberOfComments) comments"
        
        if let url = URL(string: post.thumbnail) {
            thumbnailImageView.load(url: url)
        }

    }
    
    func getEntryDate(from epoch: Double) -> String {
        
        let date = Date(timeIntervalSince1970: epoch)
        let formatter = DateFormatter()
        formatter.dateFormat = "h"
        
        let hours = Int(formatter.string(from: date)) ?? 0
        
        if hours < 1 {
            return "Less than 1 hour ago"
        } else if hours == 1 {
            return "1 hour ago"
        }
        
        return "\(formatter.string(from: date)) hours ago"
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        delegate?.dismissPost(post!)
    }
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
