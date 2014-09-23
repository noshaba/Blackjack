//
//  ViewController.swift
//  Blackjack(IBIO)
//
//  Created by Noshaba Cheema on 9/22/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import UIKit

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

class ViewController: UIViewController {
    
    internal let game : Blackjack = Blackjack()
    
    //@IBOutlet weak var consoleOutput: UILabel!
    
    @IBOutlet weak var infoOutput: UILabel!
    @IBOutlet weak var dealerCardsTitle: UILabel!
    @IBOutlet weak var currentTask: UILabel!
    @IBOutlet weak var dealerCards: UILabel!
    @IBOutlet weak var playerCardsTitle: UILabel!
    @IBOutlet weak var playerCards: UILabel!
    @IBOutlet weak var moneyTitle: UILabel!
    @IBOutlet weak var playerMoney: UILabel!
    @IBOutlet weak var playerValueTitle: UILabel!
    @IBOutlet weak var playerValue: UILabel!
    @IBOutlet weak var betTitle: UILabel!
    @IBOutlet weak var betValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.infoOutput.numberOfLines = 0
        self.infoOutput.text = "Welcome to Blackjack\nWould you like to start a new game?"
        self.currentTask.numberOfLines = 0
        self.currentTask.text = "Enter any character to continue!"
        self.resetWindow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func resetWindow(){
        self.dealerCardsTitle.text = ""
        self.dealerCards.text = ""
        self.dealerCards.numberOfLines = 0
        self.playerCardsTitle.text = ""
        self.playerCards.text = ""
        self.playerCards.numberOfLines = 0
        self.moneyTitle.text = ""
        self.playerMoney.text = ""
        self.playerValueTitle.text = ""
        self.playerValue.text = ""
        self.betTitle.text = ""
        self.betValue.text = ""
    }
    
    private func displayMoneyAndBet(){
        self.moneyTitle.text = "Money: "
        self.playerMoney.text = "$ \(self.getPlayer().money)"
        self.betTitle.text = "Bet: "
        self.betValue.text = "$ \(self.getPlayer().bet)"
    }
    
    private func displayCards(){
        self.dealerCardsTitle.text = "Dealer's Hand:"
        self.dealerCards.text = self.getDealer().cardsToString()
        self.playerCardsTitle.text = "Your Hand: "
        self.playerCards.text = self.getPlayer().cardsToString()
        self.playerValueTitle.text = "Total Value of Cards: "
        self.playerValue.text = "\(self.getPlayer().totalCardValue())"
    }
    
    private func resetCards(){
        self.dealerCards.text = ""
        self.playerCards.text = ""
        self.playerValue.text = ""
    }
    
    private func getPlayer() -> Player {
        return self.game.player
    }
    
    private func getDealer() -> Dealer {
        return self.game.dealer
    }
    
    private func newRound(){
        self.game.newRound()
        self.infoOutput.text?.extend("\nRound \(self.game.round) of 5!\nPlace your bet!")
        self.currentTask.text = "Enter any character to continue!"
        self.game.status = .Start
    }
    
    private func result(){
        switch self.game.turn(){
        case .Lost :
            self.getPlayer().lose()
            self.displayMoneyAndBet()
            self.infoOutput.text = "You lost this round!"
            self.newRound()
        case .Push :
            self.getPlayer().push()
            self.displayMoneyAndBet()
            self.infoOutput.text = "Push!"
            self.newRound()
        case .Blackjack :
            self.getPlayer().winBlackjack()
            self.displayMoneyAndBet()
            self.infoOutput.text = "You won with a Blackjack!"
            self.newRound()
        case .Win :
            self.getPlayer().win()
            self.displayMoneyAndBet()
            self.infoOutput.text = "Congratulations! You won this round!"
            self.newRound()
        default :
            self.currentTask.text = "Would you like to hit or stick?"
            self.game.status = .HitStick
        }
    }
    
    @IBAction func userInput(textField: UITextField) {
        switch self.game.status {
        case .Start:
            if textField != "" {
                self.resetCards()
                self.displayMoneyAndBet()
                self.game.status = .Bet
                self.infoOutput.text = ""
                self.currentTask.text = "Place your bet!"
            }
        case .Bet:
            self.currentTask.text = "Place your bet!"
            let bet = textField.text.doubleValue
            if bet > 0 {
                if self.getPlayer().money < bet{
                    self.infoOutput.text = "Your balance is too low!"
                } else {
                    self.getPlayer().bet = bet
                    self.betValue.text = "$ \(self.getPlayer().bet)"
                    self.playerMoney.text = "$ \(self.getPlayer().money)"
                    self.displayCards()
                    self.infoOutput.text = "Your bet is $ \(bet)"
                    
                    self.getPlayer().setAceDown()
                    
                    self.result()
                }
            } else {
                self.infoOutput.text = "Enter a double above zero!"
            }
        case .HitStick:
            if textField.text == "hit" {
                self.infoOutput.text = "You decided to hit!"
                self.getPlayer().hit(self.game.deck)
                self.displayCards()
                self.result()
            } else if textField.text == "stick" {
                self.infoOutput.text = "You decided to stick!"
            } else {
                self.currentTask.text = "Enter either 'hit' or 'stick'!"
            }
        default:
            self.infoOutput.text = "Unknown Error"
        }
        textField.text = ""
    }
}

