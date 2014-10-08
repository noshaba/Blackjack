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
    var cards = [Card]()
    internal var turnStatus : TurnStatus = .Start
    internal var turn : Bool = false
    
    internal func cardsToString() -> String {
        var cardString = ""
        for i in 0..<self.cards.count{
            if !self.cards[i].hidden {
                cardString += "\(self.cards[i].value)\t"
            } else {
                cardString += "[hidden]\t"
            }
        }
        return cardString
    }
    
    internal func setAceDown() {
        if self.totalCardValue() > 21 {
            for i in 0..<self.cards.count{
                if self.cards[i].value == 11 {
                    self.cards[i].value = 1
                    break
                }
            }
        }
    }
    
    internal func totalCardValue() -> Int {
        var sum = 0
        for i in 0..<self.cards.count{
            sum += self.cards[i].value
        }
        return sum
    }
    
    internal func hasBlackjack() -> Bool {
        return self.cards.count == 2 && self.totalCardValue() == 21
    }
    
    internal func hasOver21() -> Bool {
        return self.totalCardValue() > 21
    }
    
    internal func has21() -> Bool {
        return self.cards.count > 2 && self.totalCardValue() == 21
    }
    
    internal func hit(shoe : Shoe){
        self.cards += [shoe.getCard()]
        self.setAceDown()
    }
}