//
//  Player.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Player{
    private(set) var cards = [Card]()
    private(set) var money : Double = 100
    private(set) var bet : Double = 0
    
    internal init(deck : Deck){
        self.cards += [deck.getCard()]
        self.cards += [deck.getCard()]
    }
    
    internal func cardsToString() -> String {
        var cardString = ""
        for i in 0..<self.cards.count{
            cardString += "\(self.cards[i].value)\t"
        }
        return cardString
    }
    
    internal func totalCardValue() -> Int {
        var sum = 0
        for i in 0..<self.cards.count{
            sum += self.cards[i].value
        }
        return sum
    }
    
    internal func hasEleven() -> Bool {
        var hasEleven : Bool = false
        for i in 0..<self.cards.count{
            if self.cards[i].value == 11 {
                hasEleven = true
                break
            }
        }
        return hasEleven
    }
    
    internal func setAceDown() {
        for i in 0..<self.cards.count{
            if self.cards[i].value == 11 {
                self.cards[i].value == 1
                break
            }
        }
    }
    
    internal func setBet(bet : Double) {
        self.bet = bet
        self.money -= bet
    }
}