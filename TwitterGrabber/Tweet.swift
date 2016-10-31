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
    init (imageData: String, textData: String)
    {
        image = imageData
        text = textData
    }
    
    var text: String
    
    var image: String
}
