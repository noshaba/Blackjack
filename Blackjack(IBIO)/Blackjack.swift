//
//  Blackjack.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

enum GameStatus {
    case Start
    case Bet
}

internal class Blackjack{
    internal let deck : Deck = Deck()
    internal let player : Player
    internal let dealer : Dealer
    internal var status = GameStatus.Start
    
    internal init(){
        self.player = Player(deck: self.deck)
        self.dealer = Dealer(deck : self.deck)
    }
}