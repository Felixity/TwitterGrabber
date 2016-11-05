//
//  Tweet.swift
//  TwitterGrabber
//
//  Created by Laura on 10/28/16.
//  Copyright © 2016 Laura. All rights reserved.
//

import Foundation
import SwiftyJSON

class Tweet
{
    init (url: NSURL, textData: String)
    {
        profileImageURL = url
        text = textData
    }
    
    var text: String
    
    var profileImageURL: NSURL
}
