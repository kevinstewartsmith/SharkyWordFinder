//
//  OpeningViewController.swift
//  AstroHangman
//
//  Created by Kevin Smith on 2/26/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation
import UIKit

//import SRCountdownTimer
class OpeningViewController: UIViewController {
    @IBOutlet weak var buttonCounter: UILabel?
    var count : Int = 0
    
    func resetButtonPressed(){
        count+=1
        let countString: String? = String(count)
        print("Count: \(count)")
        
        buttonCounter?.text = "Hey"
        print(buttonCounter?.text)
    }
    func onUserAction(data: String)
    {
        count+=1
        let countString = String(count)
        buttonCounter?.text = countString
        print("Data received: \(data)")
        print(buttonCounter?.text)
    }
    
    
    override func viewDidLoad() {
        buttonCounter?.text = "Whoa"
        count = 0
        print(buttonCounter?.text)

    }
    
    
  
    

    
}
