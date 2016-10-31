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
    
    fileprivate var isSessionActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let store = Twitter.sharedInstance().sessionStore
        
        if let _ = store.session()?.userID {
            isSessionActive = true
        }
        else
        {
            let logInButton = TWTRLogInButton { (session, error) in
                if let _ = session {
                    self.isSessionActive = true
                    self.performSegue(withIdentifier: "showTabBarController", sender: self)
                } else {
                    self.isSessionActive = false
                    print("Login error: \(error!.localizedDescription)");
                }
            }
            
            // TODO: Change where the log in button is positioned in your view
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isSessionActive
        {
            self.performSegue(withIdentifier: "showTabBarController", sender: self)
        }
    }
    
}

