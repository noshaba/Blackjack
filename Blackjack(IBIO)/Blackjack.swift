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
}