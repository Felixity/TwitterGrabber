//
//  TwitterService.swift
//  TwitterGrabber
//
//  Created by Laura on 10/27/16.
//  Copyright © 2016 Laura. All rights reserved.
//

import Foundation
import TwitterKit
import SwiftyJSON

class TwitterService
{
    private init() {} // This prevents others from using the default initializer of this class
    
    static let instance = TwitterService()
    
    var userID: String?
    {
        return Twitter.sharedInstance().sessionStore.session()?.userID
    }
    
    func getTweets(for: String?, onComplete: @escaping ([Tweet]) -> Void) -> Void
    {
        var tweetCollection = [Tweet]()
        
        if let userID = userID
        {
            let client = TWTRAPIClient(userID: userID)
            
            let resourceURL = "https://api.twitter.com/1.1/statuses/home_timeline.json"
            let param: [String : Any] = ["user_id" : userID, "count" : "100", "include_rts" : "true"]
            var clientError : NSError?
            
            let request = client.urlRequest(withMethod: "GET", url: resourceURL, parameters: param, error: &clientError)

            client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                if connectionError != nil {
                    print("Error: \(connectionError)")
                }
                
                do {
                    let jsonResponse = JSON(data: data!)
                    
                    for json in jsonResponse.arrayValue
                    {
                        tweetCollection.append(Tweet(url: json["user"]["profile_image_url"].URL!, textData: json["text"].description))
                    
                    onComplete(tweetCollection)
                    }
                }
        }
        }
        else
        {
            print("Please login before retrieving tweets")
        }
    }
}
