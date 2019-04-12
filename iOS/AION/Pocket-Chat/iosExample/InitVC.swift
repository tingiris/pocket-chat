//
//  InitVC.swift
//  iosExample
//
//  Created by jeremy beal on 4/4/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

import Foundation
import UIKit

class InitVC:UIViewController {
    
    
    //TODO Store password via passphrase 
    
    
    @IBAction func GetStarted(_ sender: Any) {
   
            // transition to login screen
            performSegue(withIdentifier: "toLogin", sender: self)
   
    
    }
    
    
}
