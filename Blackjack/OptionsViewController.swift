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
        __playerNumber = Int(self.playerSlider.value)
        __deckNumber = Int(self.deckSlider.value)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePlayerAndDeckNumber() {
        self.playerNumber.text = "\(Int(self.playerSlider.value))"
        __playerNumber = Int(self.playerSlider.value)
        self.deckNumber.text = "\(Int(self.deckSlider.value))"
        __deckNumber = Int(self.deckSlider.value)
    }
    
    @IBAction func AISwitch(sender: UISwitch) { 
    }
    
}
