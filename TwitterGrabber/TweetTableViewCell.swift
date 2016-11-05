//
//  TweetTableViewCell.swift
//  TwitterGrabber
//
//  Created by Laura on 11/4/16.
//  Copyright © 2016 Laura. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    var tweet: Tweet?{
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    func updateUI()
    {
        // reset any existing tweet information
        tweetTextLabel.text = nil
        tweetProfileImageView.image =  nil
        
        // load new information from our tweet if any
        if let tweet = self.tweet
        {
            tweetTextLabel.text = tweet.text
            DispatchQueue.global(qos: .userInitiated).async {
                if let imageData = NSData(contentsOf: tweet.profileImageURL as URL)
                {
                    DispatchQueue.main.async {
                        self.tweetProfileImageView?.image = UIImage(data: imageData as Data)
                    }
                }
            }
        }
    }
}
