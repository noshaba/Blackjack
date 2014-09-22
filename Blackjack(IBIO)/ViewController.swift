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
    
    @IBOutlet weak var consoleOutput: UILabel!
    @IBOutlet weak var dealerCardsTitle: UILabel!
    @IBOutlet weak var dealerCard1: UILabel!
    @IBOutlet weak var dealerCard2: UILabel!
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
        self.consoleOutput.numberOfLines = 0
        self.consoleOutput.text = "Welcome to Blackjack\nWould you like to start a new game?\nEnter any character to continue."
        self.resetWindow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func resetWindow(){
        self.dealerCardsTitle.text = ""
        self.dealerCard1.text = ""
        self.dealerCard2.text = ""
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
        self.dealerCardsTitle.text = "Dealer's Hand"
        self.dealerCard1.text = "\(self.getDealer().card1.value)"
        self.dealerCard2.text = "[hidden]"
        self.playerCardsTitle.text = "Your Hand: "
        self.playerCards.text = self.getPlayer().cardsToString()
        self.playerValueTitle.text = "Total Value of Cards: "
        self.playerValue.text = "\(self.getPlayer().totalCardValue())"
    }
    
    private func getPlayer() -> Player {
        return self.game.player
    }
    
    private func getDealer() -> Dealer {
        return self.game.dealer
    }
    
    @IBAction func userInput(textField: UITextField) {
        switch self.game.status {
        case .Start:
            if textField != "" {
                self.displayMoneyAndBet()
                self.game.status = .Bet
                self.consoleOutput.text = "Place your bet!"
            }
        case .Bet:
            let bet = textField.text.doubleValue
            if bet > 0 {
                if self.getPlayer().money < bet{
                    self.consoleOutput.text = "Your balance is too low!"
                } else {
                    self.consoleOutput.text = "Your bet is $ \(bet)"
                    self.getPlayer().setBet(bet)
                    self.betValue.text = "$ \(self.getPlayer().bet)"
                    self.playerMoney.text = "$ \(self.getPlayer().money)"
                    self.displayCards()
                }
            } else {
                self.consoleOutput.text = "Unknown input!"
            }
        default:
            self.consoleOutput.text = "Unknown Error"
        }
        textField.text = ""
    }
}

