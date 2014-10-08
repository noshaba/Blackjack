//
//  Shoe.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 10/7/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Shoe {
    let decks = [Deck] ()
    private(set) var cards = [Card] ()
    
    internal init(var numberOfDecks : Int){
        for var i = 0; i < numberOfDecks; ++i {
            self.decks.append(Deck())
            self.cards += self.decks[i].deck
        }
        self.shuffle(self.cards)
    }
    
    internal func shuffle(var list: Array<Card>){
        for i in 0..<list.count {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            list.insert(list.removeAtIndex(j), atIndex: i)
        }
        self.cards = list
    }
    
    internal func getCard() -> Card {
        let lastCard = self.cards[self.cards.count-1]
        self.cards.removeLast()
        return lastCard
    }
    
    internal func addPlayerAndDealerCards(players : [Player], dealer : Dealer){
        self.cards.removeAll()
        
        for i in 0..<players.count {
            for j in 0..<players[i].cards.count {
                if players[i].cards[j].value == 1 {
                    players[i].cards[j].value = 11
                }
            }
            self.cards += players[i].cards
        }
        for i in 0..<dealer.cards.count {
            if dealer.cards[i].value == 1 {
                dealer.cards[i].value = 11
            }
        }
        
        self.cards += dealer.cards + self.cards
    }
}