//
//  ViewController.swift
//  TwitterGrabber
//
//  Created by Laura on 10/26/16.
//  Copyright © 2016 Laura. All rights reserved.
//

import UIKit
import TwitterKit
@IBDesignable

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let store = Twitter.sharedInstance().sessionStore
        
        if let userID = store.session()?.userID {
            print("user is logged in with id \(userID)")
            self.performSegue(withIdentifier: "showTabBarController", sender: self)
        }
        else
        {
            print("user is not logged in")
            let logInButton = TWTRLogInButton { (session, error) in
                if let _ = session {
                    self.performSegue(withIdentifier: "showTabBarController", sender: self)
                } else {
                    print("Login error: \(error!.localizedDescription)");
                }
            }
            
            // TODO: Change where the log in button is positioned in your view
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
        }
        
    }

}

