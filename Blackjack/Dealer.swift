//
//  Dealer.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Dealer : Person{
    
    internal override init(shoe : Shoe){
        super.init(shoe: shoe)
        self.cards[1].hidden = true
    }
    
    internal func cardsVisible() -> Bool {
        for i in 0..<self.cards.count{
            if self.cards[i].hidden {
                return false
            }
        }
        return true
    }

}