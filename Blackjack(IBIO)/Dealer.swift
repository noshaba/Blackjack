//
//  Dealer.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Dealer{
    internal let card1 : Card
    internal let card2 : Card
    
    internal init(deck : Deck){
        card1 = deck.getCard()
        card2 = deck.getCard()
    }
}