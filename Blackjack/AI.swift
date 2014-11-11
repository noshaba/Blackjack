//
//  AI.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 11/9/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation

internal class AI : Player {
    
    enum Move : Character{
        case Hit = "H", Stand = "S", Double = "D"
    }
    
    internal var dealersUpCard : Card
    
    internal init(shoe : Shoe, playerNumber : Int, dealersUpCard : Card){
        self.dealersUpCard = dealersUpCard
        super.init(shoe: shoe, playerNumber: playerNumber)
    }
    
    internal func bet(){
        if self.money < 5 {
            self.bet = 1
        } else {
            self.bet = 5
        }
    }
    
    internal func move() -> Move{
        // Strategy is 'Wizard's Simple Stragy'
        for key in self.hand.status.keys{
            print(key.rawValue)
            println("\(self.hand.status[key]!)")
            println("\(self.dealersUpCard.value)")
            if key == Hand.Status.Soft{
                switch self.hand.status[key]!{
                case 13...15:
                    return .Hit
                case 16...18:
                    switch self.dealersUpCard.value {
                    case 2...6:
                        return .Double
                    default:
                        return .Hit
                    }
                case 19...21:
                    return .Stand
                default:
                    return .Hit
                }
            } else {
                switch self.hand.status[key]!{
                case 4...8:
                    return .Hit
                case 9:
                    switch self.dealersUpCard.value {
                    case 2...6:
                        return .Double
                    default:
                        return .Hit
                    }
                case 10,11:
                    switch self.dealersUpCard.value {
                    case 2...6:
                        return .Double
                    default:
                        return .Hit
                    }
                case 12...16:
                    switch self.dealersUpCard.value {
                    case 2...6:
                        return .Stand
                    default:
                        return .Hit
                    }
                case 17...21:
                    return .Stand
                default:
                    return .Hit
                }
            }
        }
        return .Hit
    }
    
}
