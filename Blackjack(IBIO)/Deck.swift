//
//  Deck.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Deck{
    private(set) var deck = [Card]()
    
    internal init(){
        self.deck  = [Card](count: 4, repeatedValue: Card(value: 2))
        self.deck += [Card](count: 4, repeatedValue: Card(value: 3))
        self.deck += [Card](count: 4, repeatedValue: Card(value: 4))
        self.deck += [Card](count: 4, repeatedValue: Card(value: 5))
        self.deck += [Card](count: 4, repeatedValue: Card(value: 6))
        self.deck += [Card](count: 4, repeatedValue: Card(value: 7))
        self.deck += [Card](count: 4, repeatedValue: Card(value: 8))
        self.deck += [Card](count: 4, repeatedValue: Card(value: 9))
        self.deck += [Card](count:16, repeatedValue: Card(value:10))
        self.deck += [Card](count: 4, repeatedValue: Card(value:11))
        self.shuffle(self.deck)
    }
    
    internal func shuffle(var list: Array<Card>){
        for i in 0..<list.count {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            list.insert(list.removeAtIndex(j), atIndex: i)
        }
        self.deck = list
    }
    
    internal func getCard() -> Card {
        let lastCard = self.deck[self.deck.count-1]
        self.deck.removeLast()
        return lastCard
    }
}