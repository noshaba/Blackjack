//
//  Blackjack.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal var __playerNumber = 2
internal var __deckNumber = 3

internal class Blackjack{
    internal let shoe : Shoe
    internal let dealer : Dealer
    internal let players = [Player]()
    private(set) var round : Int = 1
    
    internal init(){
        self.shoe = Shoe(numberOfDecks: __deckNumber)
        for var i = 0; i < __playerNumber; ++i {
            self.players.append(Player(shoe : self.shoe, playerNumber : i+1))
        }
        self.dealer = Dealer(shoe : self.shoe)
    }
    
    internal func newRound(){
        self.round++
        self.dealer.openCards()
        self.shoe.addPlayerAndDealerCards(self.players, dealer : self.dealer)
        if self.round % 5 == 0 {
            self.shoe.shuffle(self.shoe.cards)
        }
        self.dealer.reset(self.shoe)
        for i in 0..<self.players.count {
            self.players[i].reset(self.shoe)
        }
    }
    
    internal func anyPlayerTooLowBalance() -> Bool {
        for i in 0..<self.players.count{
            if self.players[i].money < 1 {
                return true
            }
        }
        return false
    }
    
    internal func setDealersTurn(turn : Bool){
        self.dealer.turn = turn
    }
    
    internal func dealersTurn() -> Bool {
        return self.dealer.turn
    }
}