//
//  OptionsViewController.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 10/7/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var deckNumber: UILabel!
    @IBOutlet weak var playerSlider: UISlider!
    @IBOutlet weak var deckSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePlayerAndDeckNumber() {
        self.playerNumber.text = "\(Int(playerSlider.value))"
        __playerNumber = Int(playerSlider.value)
        self.deckNumber.text = "\(Int(deckSlider.value))"
        __deckNumber = Int(deckSlider.value)
    }
    
    @IBAction func AISwitch(sender: UISwitch) { 
    }
    
}
