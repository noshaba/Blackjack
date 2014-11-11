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
        self.hideSecondCard()
    }
    
    internal override func reset(shoe : Shoe){
        super.reset(shoe)
        self.hideSecondCard()
    }
    
    internal func getUpCard() -> Card {
        return self.hand.cards[1]
    }
}