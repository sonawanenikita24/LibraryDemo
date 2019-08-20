//
//  ViewController.swift
//  LibraryDemo
//
//  Created by BridgeLabz on 19/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let stringrandom = numberGenerator.string()
        let numberrandom = numberGenerator.integer()
        
        print(stringrandom)
        print(numberrandom)
        
    }


}

