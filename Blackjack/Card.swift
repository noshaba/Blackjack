//
//  Card.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import Foundation
import UIKit

internal struct Card {
    
    // nested Suit enumeration
    internal enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    // nested Rank enumeration
    internal enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        var value: Int {
            switch self {
            case .Ace:
                return 11
            case .Jack, .Queen, .King:
                return 10
            default:
                return self.rawValue
            }
        }
    }
    
    private let suit: Suit
    private let rank: Rank
    internal var hidden: Bool = false
    internal var value: Int
    private let image : UIImage!
    private let imageBack : UIImage!
    private var imageView : UIImageView!
    
    init(rank: Rank, suit: Suit, image : String, imageBack : String) {
        self.suit = suit
        self.rank = rank
        self.value = rank.value
        self.image = UIImage(named: image)
        self.imageBack = UIImage(named: imageBack)
        self.imageView = UIImageView(frame: CGRectMake(0, 0, self.image!.size.width, self.image!.size.height))
        self.imageView.image = self.image
    }
    
    internal var description: String {
        return "suit is \(suit.rawValue), value is \(value)"
    }
    
    internal func draw(posX : CGFloat, posY : CGFloat, view : UIView){
        if !self.imageView.isDescendantOfView(view){
            self.imageView.frame = CGRect(x: posX, y: posY, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height)
            view.addSubview(imageView)
        }
    }
    
    internal func undraw(){
        self.imageView.removeFromSuperview()
    }
    
    internal func turnCard(){
        if self.imageView.image == self.image {
            self.imageView.image = self.imageBack
        } else {
            self.imageView.image = self.image
        }
    }
}