//
//  FeedTableViewCell.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var readIndicatorView: UIView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var entryDateLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissButtonView: UIView!
    @IBOutlet weak var commentsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
 
    
    func setupView() {
        backgroundColor = .black
        
        authorLabel.textColor = .white
        entryDateLabel.textColor = .lightGray
        titleLabel.textColor = .white
        commentsLabel.textColor = .orange
        
        readIndicatorView.layer.cornerRadius = readIndicatorView.layer.frame.height / 2
    }
    
    func setupContent(with post: Post) {
        titleLabel.text = post.title
        authorLabel.text = post.author
        entryDateLabel.text = getEntryDate(from: post.created)
        commentsLabel.text = "\(post.numberOfComments) comments"
        
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
}
