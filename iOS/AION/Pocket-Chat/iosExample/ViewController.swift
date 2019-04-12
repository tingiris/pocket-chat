//
//  ViewController.swift
//  iosExample
//
//  Created by jeremy beal on 3/14/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

import UIKit
import PocketEth
import PocketAion


class ViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
   //TODO find out how to store keys locally, whether imported or auto created.
    
    @IBOutlet weak var private_Key_text: UITextField!
    
    
    @IBOutlet  weak var pubKey: UITextField!
    
    @IBOutlet weak var maybeError: UILabel!
    
    
    @IBAction func importButton(_ sender: Any) {

        
        
        let pkString: String = private_Key_text.text!
        
        //UserDefaults.standard.set(pkString, forKey: "privKey")
        
        let pubKeyString: String = pubKey.text!
        
        //UserDefaults.standard.set(pubKey, forKey: "publicKey")
       
        
            //TODO add import wallet feature here
                
            performSegue(withIdentifier: "toMessage", sender: self)
        
           
           
            
        
            print("error")
            
            
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: "Failed to Import wallet \(error) AMP. The hash is", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }
            
        
       
    }
   
    @IBAction func createWalletButton(_ sender: Any) {
        
        //TODO connect to CreateWalletVC
      
    }
    
    
    
    // address 0xB0fEE26f7671Be33ab5C2eCB82208123535FFAc3
    // pk 5fc239d9f12299cf910786840fc8779d771a12fbd69bd2a036a84b3a79960354


}

