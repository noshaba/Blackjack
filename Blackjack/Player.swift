//
//  Player.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Player : Person{
    internal let playerNumber : Int
    internal var money : Double = 100
    internal var bet : Double = 0
    internal var gameStatus : GameStatus = .Continue
    
    internal init(shoe : Shoe, playerNumber : Int){
        self.playerNumber = playerNumber
        super.init(shoe: shoe)
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
    
    internal func gameStatus(let dealer : Dealer) -> GameStatus{
        self.setAceDown()
        dealer.setAceDown()
        if self.hasOver21(){
            return GameStatus.Lost
        }
        if dealer.cardsVisible() {
            if self.hasBlackjack() && dealer.hasBlackjack() {
                return GameStatus.Push
            } else if self.hasBlackjack() && !dealer.hasBlackjack(){
                return GameStatus.Blackjack
            } else if dealer.hasBlackjack() && !self.hasBlackjack(){
                return GameStatus.Lost
            } else if dealer.hasOver21(){
                return GameStatus.Win
            } else if dealer.totalCardValue() == self.totalCardValue(){
                return GameStatus.Push
            } else if dealer.totalCardValue() > self.totalCardValue(){
                return GameStatus.Lost
            } else if dealer.totalCardValue() < self.totalCardValue(){
                return GameStatus.Win
            }
        }
        return GameStatus.Continue
    }
    
    internal override func reset(shoe : Shoe){
        super.reset(shoe)
        self.turnStatus = .Start
    }
}