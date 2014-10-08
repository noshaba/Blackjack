//
//  Dealer.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Dealer : Person{
    
    internal init(shoe : Shoe){
        super.init()
        self.cards += [shoe.getCard()]
        self.cards += [shoe.getCard()]
        self.cards[1].hidden = true
        self.setAceDown()
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