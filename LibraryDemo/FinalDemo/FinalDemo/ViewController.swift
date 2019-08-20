//
//  ViewController.swift
//  FinalDemo
//
//  Created by BridgeLabz on 19/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import Demolibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let PrintMessage = randomnumber.getMessage()

        let customMessage = randomnumber.getCustomMessage(string: PrintMessage)
        
        print(customMessage)
        
       let isEdit = randomnumber.saveUserData(email: "sonawanenikita2@gmail.com", password: "abcd@24")
       
        
        randomnumber.RetriveUserdata(email: "sonawanenikita2@gmail.com", password: "abcd@24")
        
        
    }


}

