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
    internal var dealersTurn : Bool = false
    private(set) var round : Int = 1
    
    internal init(){
        self.shoe = Shoe(numberOfDecks: __deckNumber)
        for var i = 0; i < __playerNumber; ++i {
            self.players.append(Player(shoe : self.shoe, playerNumber : i+1))
        }
        self.dealer = Dealer(shoe : self.shoe)
    }
    
//    internal func turn(let currentPlayer : Player) -> GameStatus{
//        if currentPlayer.hasBlackjack() && self.dealer.hasBlackjack() {
//            return GameStatus.Push
//        } else if currentPlayer.hasBlackjack() && !self.dealer.hasBlackjack(){
//            return GameStatus.Blackjack
//        } else if currentPlayer.hasOver21(){
//            return GameStatus.Lost
//        } else if self.dealer.cardsVisible(){
//            if self.dealer.hasBlackjack() && !currentPlayer.hasBlackjack(){
//                return GameStatus.Lost
//            } else if self.dealer.hasOver21(){
//                return GameStatus.Win
//            } else if self.dealer.totalCardValue() == currentPlayer.totalCardValue(){
//                return GameStatus.Push
//            } else if self.dealer.totalCardValue() > currentPlayer.totalCardValue(){
//                return GameStatus.Lost
//            } else if self.dealer.totalCardValue() < currentPlayer.totalCardValue(){
//                return GameStatus.Win
//            }
//        }
//        return GameStatus.Continue
//    }
    
    internal func newRound(){
        self.round++
        self.openCards()
        self.shoe.addPlayerAndDealerCards(self.players, dealer : self.dealer)
        if self.round % 5 == 0 {
            self.shoe.shuffle(self.shoe.cards)
        }
        for i in 0..<self.players.count {
            self.players[i].cards.removeAll()
            self.players[i].cards += [self.shoe.getCard()]
            self.players[i].cards += [self.shoe.getCard()]
        }
        self.dealer.cards.removeAll()
        self.dealer.cards += [self.shoe.getCard()]
        self.dealer.cards += [self.shoe.getCard()]
        self.dealer.cards[1].hidden = true
    }
    
    internal func openCards(){
        for i in 0..<self.dealer.cards.count{
            self.dealer.cards[i].hidden = false
        }
    }
}