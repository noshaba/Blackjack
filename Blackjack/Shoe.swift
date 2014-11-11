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
        
        for i in 0..<players.count {
            players[i].resetAces()
            self.cards = players[i].getCards() + self.cards
            players[i].removeCards()
        }
        
        dealer.resetAces()
        self.cards = dealer.getCards() + self.cards
        dealer.removeCards()
    }
    
    internal func undrawCards(){
        for card in self.cards {
            card.undraw()
        }
    }
}
