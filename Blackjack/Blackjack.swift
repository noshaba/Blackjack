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
internal var __AI = false

internal class Blackjack{
    internal let shoe : Shoe
    internal let dealer : Dealer
    internal let players = [Player]()
    private(set) var round : Int = 1
    
    internal init(){
        self.shoe = Shoe(numberOfDecks: __deckNumber)
        self.dealer = Dealer(shoe : self.shoe)
        for var i = 0; i < __playerNumber; ++i {
            if i == __playerNumber - 1 && __AI{
                self.players.append(AI(shoe : self.shoe, playerNumber : i+1, dealersUpCard: self.dealer.getUpCard()))
            } else {
                self.players.append(Player(shoe : self.shoe, playerNumber : i+1))
            }
        }
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
        if __AI {
            if let ai = self.players.last as? AI{
                ai.dealersUpCard = self.dealer.getUpCard()
            }
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
    
    internal func undrawCards() {
        self.shoe.undrawCards()
    }
}