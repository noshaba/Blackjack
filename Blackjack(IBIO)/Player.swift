//
//  Player.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Player : Person{
    private(set) var money : Double = 100
    internal var bet : Double = 0
    
    internal init(deck : Deck){
        super.init()
        self.cards += [deck.getCard()]
        self.cards += [deck.getCard()]
    }
    
    internal func lose(){
        self.money -= self.bet
        self.bet = 0
    }
    
    internal func push(){
        self.bet = 0
    }
    
    internal func win(){
        self.money += self.bet
        self.bet = 0
    }
    
    internal func winBlackjack(){
        self.money += (self.bet * 1.5)
        self.bet = 0
    }
}