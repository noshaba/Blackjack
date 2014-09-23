//
//  Dealer.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Dealer : Person{
    
    internal init(deck : Deck){
        super.init()
        self.cards += [deck.getCard()]
        self.cards += [deck.getCard()]
        self.cards[1].hidden = true
    }
    
    internal func cardsVisible() -> Bool {
        return !self.cards[1].hidden
    }

}