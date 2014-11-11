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
        let Ranks = [Card.Rank.Ace, Card.Rank.King, Card.Rank.Queen, Card.Rank.Jack, Card.Rank.Ten, Card.Rank.Nine, Card.Rank.Eight, Card.Rank.Seven, Card.Rank.Six, Card.Rank.Five, Card.Rank.Four, Card.Rank.Three, Card.Rank.Two]
        let Suits = [Card.Suit.Clubs, Card.Suit.Spades, Card.Suit.Hearts, Card.Suit.Diamonds]
        var image = 0
        for rank in Ranks {
            for suit in Suits {
                image++
                self.deck.append(Card(rank: rank, suit: suit, image: String(image), imageBack: "b2fv"))
            }
        }
    }
}