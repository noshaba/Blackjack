//
//  Hand.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 11/9/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation
import UIKit

internal class Hand{
    var cards = [Card]()
    internal var turnStatus : TurnStatus = .Start
    internal var turn : Bool = false
    
    internal init(shoe : Shoe){
        self.cards += [shoe.getCard()]
        self.cards += [shoe.getCard()]
        self.setAceDown()
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
        self.cards[0].hidden = true
        self.cards[0].turnCard()
    }
    
    internal func openCards(){
        self.cards[0].hidden = false
        self.cards[0].turnCard()
    }
    
    internal func removeCards(){
        self.cards.removeAll()
    }
    
    internal func getCards() -> [Card] {
        return self.cards
    }
    
    internal func reset(shoe : Shoe){
        self.undrawCards()
        self.cards += [shoe.getCard()]
        self.cards += [shoe.getCard()]
        self.setAceDown()
    }
    
    internal func drawCards(posY : CGFloat, view : UIView){
        for i in 0..<self.cards.count{
            self.cards[i].draw(CGFloat(17 + i * 10),posY: posY,view: view)
        }
    }
    
    internal func undrawCards(){
        for card in self.cards {
            card.undraw()
        }
    }
    
    internal func firstTwoCards() -> Bool {
        return self.cards.count == 2
    }
}
