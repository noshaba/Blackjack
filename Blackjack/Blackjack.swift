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
    case HitStick
    case Dealer
}

enum TurnStatus {
    case Lost
    case Push
    case Win
    case Blackjack
    case Continue
}

internal class Blackjack{
    internal let deck : Deck = Deck()
    internal let player : Player
    internal let dealer : Dealer
    internal var status = GameStatus.Start
    private(set) var round : Int = 1
    internal var dealersTurn : Bool = false
    
    internal init(){
        self.player = Player(deck : self.deck)
        self.dealer = Dealer(deck : self.deck)
    }
    
    internal func turn() -> TurnStatus{
        if self.player.hasBlackjack() && self.dealer.hasBlackjack() {
            return TurnStatus.Push
        } else if self.player.hasBlackjack() && !self.dealer.hasBlackjack(){
            return TurnStatus.Blackjack
        } else if self.player.hasOver21(){
            return TurnStatus.Lost
        } else if self.dealer.cardsVisible(){
            if self.dealer.hasBlackjack() && !self.player.hasBlackjack(){
                return TurnStatus.Lost
            } else if self.dealer.hasOver21(){
                return TurnStatus.Win
            } else if self.dealer.totalCardValue() == self.player.totalCardValue(){
                return TurnStatus.Push
            } else if self.dealer.totalCardValue() > self.player.totalCardValue(){
                return TurnStatus.Lost
            } else if self.dealer.totalCardValue() < self.player.totalCardValue(){
                return TurnStatus.Win
            }
        }
        return TurnStatus.Continue
    }
    
    internal func newRound(){
        self.round++
        self.dealer.cards[1].hidden = false
        self.deck.addPlayerAndDealerCards(self.player.cards, dealerCards : self.dealer.cards)
        if self.round % 5 == 0 {
            self.deck.shuffle(self.deck.deck)
        }
        self.player.cards.removeAll()
        self.dealer.cards.removeAll()
        self.player.cards += [self.deck.getCard()]
        self.player.cards += [self.deck.getCard()]
        self.dealer.cards += [self.deck.getCard()]
        self.dealer.cards += [self.deck.getCard()]
        self.dealer.cards[1].hidden = true
    }
    
    internal func openCards(){
        for i in 0..<self.deck.deck.count{
            self.deck.deck[i].hidden = false
        }
        for i in 0..<self.dealer.cards.count{
            self.dealer.cards[i].hidden = false
        }
    }
}