//
//  AI.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 11/9/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class AI : Player {
    
    var dealersUpCard : Card
    
    internal init(shoe : Shoe, playerNumber : Int, dealersUpCard : Card){
        self.dealersUpCard = dealersUpCard
        super.init(shoe: shoe, playerNumber: playerNumber)
    }
    
    internal func turn(){
        
    }
    
}
