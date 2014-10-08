//
//  Deck.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Deck{
    private(set) var deck = [Card]()
    
    internal init(){
        for var i = 0; i < 4; ++i {
            self.deck.append(Card(value: 2))
            self.deck.append(Card(value: 3))
            self.deck.append(Card(value: 4))
            self.deck.append(Card(value: 5))
            self.deck.append(Card(value: 6))
            self.deck.append(Card(value: 7))
            self.deck.append(Card(value: 8))
            self.deck.append(Card(value: 9))
            self.deck.append(Card(value:11))
        }
        for var i = 0; i < 16; ++i {
            self.deck.append(Card(value: 10))
        }
     //   self.shuffle(self.deck)
    }
    
//    internal func shuffle(var list: Array<Card>){
//        for i in 0..<list.count {
//            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
//            list.insert(list.removeAtIndex(j), atIndex: i)
//        }
//        self.deck = list
//    }
//    
//    internal func getCard() -> Card {
//        let lastCard = self.deck[self.deck.count-1]
//        self.deck.removeLast()
//        return lastCard
//    }
//    
//    internal func addPlayerAndDealerCards(playerCards : [Card], dealerCards : [Card]){
//        for i in 0..<playerCards.count {
//            if playerCards[i].value == 1 {
//                playerCards[i].value = 11
//            }
//        }
//        for i in 0..<dealerCards.count {
//            if dealerCards[i].value == 1 {
//                dealerCards[i].value = 11
//            }
//        }
//        self.deck = playerCards + dealerCards + self.deck
//    }
}