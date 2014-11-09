//
//  Person.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

enum TurnStatus {
    case Start
    case Bet
    case HitStand
    case Dealer
}

enum GameStatus {
    case Lost
    case Push
    case Win
    case Blackjack
    case Continue
}

internal class Person{
    internal var turnStatus : TurnStatus = .Start
    internal var turn : Bool = false
    
    let hand : Hand
    
    internal init(shoe : Shoe){
        self.hand = Hand(shoe: shoe)
    }
    
    internal func cardsToString() -> String {
        return self.hand.cardsToString()
    }
    
    internal func setAceDown() {
        self.hand.setAceDown()
    }
    
    internal func resetAces(){
        self.hand.resetAces()
    }
    
    internal func totalCardValue() -> Int {
        return self.hand.totalCardValue()
    }
    
    internal func hasBlackjack() -> Bool {
        return self.hand.hasBlackjack()
    }
    
    internal func hasOver21() -> Bool {
        return self.hand.hasOver21()
    }
    
    internal func has21() -> Bool {
        return self.hand.has21()    }
    
    internal func hit(shoe : Shoe){
        self.hand.hit(shoe)
    }
    
    internal func cardsVisible() -> Bool {
        return self.hand.cardsVisible()
    }
    
    internal func hideSecondCard(){
        self.hand.hideSecondCard()
    }
    
    internal func openCards(){
        self.hand.openCards()
    }
    
    internal func removeCards(){
        self.hand.removeCards()
    }
    
    internal func getCards() -> [Card] {
        return self.hand.getCards()
    }
    
    internal func reset(shoe : Shoe){
        self.hand.reset(shoe)
        self.turn = false
    }
}