//
//  Hand.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 11/9/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Hand{
    var cards = [Card]()
    internal var turnStatus : TurnStatus = .Start
    internal var turn : Bool = false
    
    internal init(shoe : Shoe){
        self.cards += [shoe.getCard()]
        self.cards += [shoe.getCard()]
        self.setAceDown()
    }
    
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
    
    internal func resetAces(){
        for i in 0..<self.cards.count{
            if self.cards[i].value == 1 {
                self.cards[i].value = 11
                break
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
    
    internal func cardsVisible() -> Bool {
        for i in 0..<self.cards.count{
            if self.cards[i].hidden {
                return false
            }
        }
        return true
    }
    
    internal func hideSecondCard(){
        self.cards[1].hidden = true
    }
    
    internal func openCards(){
        self.cards[1].hidden = false
    }
    
    internal func removeCards(){
        self.cards.removeAll()
    }
    
    internal func getCards() -> [Card] {
        return self.cards
    }
    
    internal func reset(shoe : Shoe){
        self.cards += [shoe.getCard()]
        self.cards += [shoe.getCard()]
        self.setAceDown()
    }
}
