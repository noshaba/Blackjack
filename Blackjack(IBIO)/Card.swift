//
//  Card.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class Card {
    private(set) var value : Int
    internal var hidden = false
    
    internal init(value : Int){
        self.value = value
    }
}