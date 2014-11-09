//
//  Deck.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Deck{
    private(set) var deck = [Card]()
    
    internal init(){
        for var i = 0; i < 4; ++i {
            self.deck.append(Card(value: 2))
            self.deck.append(Card(value: 3))
            self.deck.append(Card(value: 4))
            self.deck.append(Card(value: 5))
            self.deck.append(Card(value: 6))
            self.deck.append(Card(value: 7))
            self.deck.append(Card(value: 8))
            self.deck.append(Card(value: 9))
            self.deck.append(Card(value:11))
        }
        for var i = 0; i < 16; ++i {
            self.deck.append(Card(value: 10))
        }
    }
}