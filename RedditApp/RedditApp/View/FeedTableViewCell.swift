//
//  FeedTableViewCell.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

//    @IBOutlet weak var readIndicatorImageView: UIImageView!
//    @IBOutlet weak var authorLabel: UILabel!
//    @IBOutlet weak var entryDateLabel: UILabel!
//    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var dismissButtonView: UIView!
//    @IBOutlet weak var commentsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
 
    
    func setup(with post: Post) {
        titleLabel.text = post.title
    }
}
