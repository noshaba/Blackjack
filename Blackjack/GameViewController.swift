//
//  GameViewController.swift
//  Blackjack
//
//  Created by Noshaba Cheema on 10/7/14.
//  Copyright (c) 2014 Noshaba Cheema. All rights reserved.
//

import UIKit

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

class GameViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cardValueDealer: UILabel!
    @IBOutlet weak var dealersHandTitle: UILabel!
    @IBOutlet weak var gameInfo: UILabel!
    @IBOutlet weak var currentTask: UILabel!
    @IBOutlet weak var playersHandTitle: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var cardValuePlayer: UILabel!
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var doubleButton: UIButton!
    @IBOutlet weak var moneyTitle: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var betTitle: UILabel!
    @IBOutlet weak var bet: UILabel!
    @IBOutlet weak var betConfirmationButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var infoBG: UIImageView!
    
    
    private var game : Blackjack?
    private var playerIndex : Int = 0
    private var currentPlayer : Player?
    private var betBuffer : Double = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textField.keyboardType = UIKeyboardType.NumberPad
        self.game = Blackjack()
        self.gameInfo.numberOfLines = 0
        self.currentTask.numberOfLines = 0
        self.run()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.textField.resignFirstResponder()
        self.view.endEditing(true)
        if !self.currentPlayer!.turn{
            self.currentPlayer!.undrawCards()
            self.playerIndex += 1
            self.run()
        }
    }
    
    private func aiMove(ai: AI){
        switch ai.move(){
        case AI.Move.Double:
            self.double()
        case AI.Move.Stand:
            self.stand()
        default:
            self.hit()
        }
        println(ai.move().rawValue)
    }
    
    private func stand(){
        if self.currentPlayer!.turn && !self.game!.dealersTurn() && self.currentPlayer!.gameStatus(self.game!.dealer) != .Lost {
            self.gameInfo.text = "You decided to stand!"
            self.infoBGAnimation()
            if self.lastPlayer() {
                self.game!.setDealersTurn(true)
            }
            self.nextPlayer()
        }
    }
    
    private func double(){
        if self.currentPlayer!.turn && !self.game!.dealersTurn() && self.currentPlayer!.gameStatus(self.game!.dealer) != .Lost {
            if !self.currentPlayer!.firstTwoCards(){
                self.gameInfo.text = "You can only double on the first two cards!"
                self.infoBGAnimation()
            } else {
                let double = self.currentPlayer!.bet * 2
                if double > self.currentPlayer!.money {
                    self.gameInfo.text = "Your balance is too to double!"
                    self.infoBGAnimation()
                } else {
                    self.gameInfo.text = "You decided to double!"
                    self.infoBGAnimation()
                    self.currentPlayer!.bet *= 2
                    self.currentPlayer!.hit(self.game!.shoe)
                    self.updatePlayerCards()
                    self.result()
                    if self.lastPlayer() {
                        self.game!.setDealersTurn(true)
                    }
                    self.nextPlayer()
                }
            }
        }
    }
    
    private func hit(){
        if self.currentPlayer!.turn && !self.game!.dealersTurn() && self.currentPlayer!.gameStatus(self.game!.dealer) != .Lost {
            self.gameInfo.text = "You decided to hit!"
            self.infoBGAnimation()
            self.currentPlayer!.hit(self.game!.shoe)
            self.updatePlayerCards()
            self.result()
        }
    }
    
    @IBAction func stand(sender: UIButton) {
        self.stand()
    }
    
    @IBAction func hit(sender: UIButton) {
        self.hit()
    }
    
    @IBAction func double(sender: UIButton) {
        self.double()
    }
    
    
    @IBAction func placeBet() {
        self.betBuffer = self.textField.text.doubleValue
    }
    
    @IBAction func confirmBet(sender: UIButton) {
        self.textField.resignFirstResponder()
        self.view.endEditing(true)
        self.placeBet()
        self.textField.text = ""
        self.textField.hidden = true
        self.currentPlayer!.turnStatus = .Bet
        self.turn()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func infoBGAnimation(){
        self.gameInfo.hidden = true
        self.infoBG.hidden = false
        UIView.animateWithDuration(0.01, delay: 0, options: .CurveEaseInOut, animations: {
                self.infoBG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0)
            }, completion: { finished in
                UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseInOut, animations: {
                    self.infoBG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1)
                    }, completion: { finished in
                        UIView.animateWithDuration(0.25, delay: 0, options: .CurveEaseInOut, animations: {
                            self.infoBG.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
                            }, completion: { finished in
                                self.gameInfo.hidden = false
                        })
                })
        })
    }
    
    private func lastPlayer() -> Bool{
        return self.playerIndex == self.game!.players.count - 1
    }
    
    private func updatePlayerCards(){
        self.cardValuePlayer.text = "\(self.currentPlayer!.totalCardValue())"
        self.currentPlayer!.drawCards(self.playersHandTitle.frame.origin.y+40, view: self.view)
    }
    
    private func undrawCards(){
        self.game!.undrawCards()
    }
    
    private func updateDealerCards(){
        self.cardValueDealer.text = "\(self.game!.dealer.totalCardValue())"
        self.game!.dealer.drawCards(self.dealersHandTitle.frame.origin.y+40, view: self.view)
    }
    
    private func updatePlayersBalances(){
        self.money.text = "$ \(self.currentPlayer!.money)"
        self.bet.text = "$ \(self.currentPlayer!.bet)"
    }
    
    private func resetWindow(){
        self.gameInfo.text = ""
        self.infoBG.hidden = true
        self.currentTask.text = ""
        self.cardValueDealer.text = ""
        self.undrawCards()
        self.money.text = ""
        self.bet.text = ""
        self.cardValuePlayer.text = ""
        self.playerNumber.text = ""
        self.dealersHandTitle.hidden = true
        self.playersHandTitle.hidden = true
        self.moneyTitle.hidden = true
        self.betTitle.hidden = true
        self.standButton.hidden = true
        self.hitButton.hidden = true
        self.doubleButton.hidden = true
        self.textField.hidden = true
        self.betConfirmationButton.hidden = true
    }
    
    private func betWindow(){
        self.resetWindow()
        self.currentTask.text = "Place your bet!"
        self.money.text = "$ \(self.currentPlayer!.money)"
        self.bet.text = "$ \(self.currentPlayer!.bet)"
        self.playerNumber.text = "\(self.currentPlayer!.playerNumber)"
        self.betConfirmationButton.hidden = false
        self.moneyTitle.hidden = false
        self.betTitle.hidden = false
        self.textField.hidden = false
        if let ai = self.currentPlayer! as? AI {
            ai.bet()
            ai.turnStatus = .HitStand
            self.betConfirmationButton.hidden = true
            self.textField.hidden = true
            self.bet.text = "$ \(ai.bet)"
            self.playerNumber.text = "AI"
            self.nextPlayer()
        }
    }
    
    private func gamePlayWindow(){
        self.dealersHandTitle.hidden = false
        self.playersHandTitle.hidden = false
        self.moneyTitle.hidden = false
        self.betTitle.hidden = false
        self.standButton.hidden = false
        self.hitButton.hidden = false
        self.doubleButton.hidden = false
        self.gameInfo.text = ""
        self.infoBG.hidden = true
        self.currentTask.text = ""
        self.playerNumber.text = "\(self.currentPlayer!.playerNumber)"
        self.updatePlayerCards()
        self.cardValuePlayer.text = "\(self.currentPlayer!.totalCardValue())"
        self.updateDealerCards()
        self.money.text = "$ \(self.currentPlayer!.money)"
        self.bet.text = "$ \(self.currentPlayer!.bet)"
        self.cardValueDealer.text = ""
        self.currentTask.text = "Would you like to hit, stand or double?"
        if let ai = self.currentPlayer! as? AI {
            self.aiMove(ai)
            self.playerNumber.text = "AI"
        }
    }
    
    private func nextPlayer(){
        self.currentPlayer!.turn = false
        self.currentTask.text = "Tap the screen for the next player!"
    }
    
    private func checkPlacedBet(){
        if self.betBuffer >= 1 {
            if self.currentPlayer!.money < self.betBuffer{
                self.gameInfo.text = "Your balance is too low!"
                self.infoBGAnimation()
                self.textField.hidden = false
            } else {
                self.currentPlayer!.bet = self.betBuffer
                self.bet.text = "$ \(self.currentPlayer!.bet)"
                self.gameInfo.text = "Your bet is $ \(self.currentPlayer!.bet)"
                self.infoBGAnimation()
                self.currentPlayer!.turnStatus = .HitStand
                self.betConfirmationButton.hidden = true
                self.nextPlayer()
            }
        } else {
            self.gameInfo.text = "Minimum bet is $1!"
            self.infoBGAnimation()
            self.textField.hidden = false
        }
    }
    
    private func newRound(){
        self.game!.newRound()
        if self.game!.round % 5 == 0 {
            self.gameInfo.text = "Cards were shuffled!"
            self.infoBGAnimation()
        }
        if self.game!.anyPlayerTooLowBalance(){
            let mainMenu = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuViewController") as MainMenuViewController
            mainMenu.modalTransitionStyle = .CoverVertical
            self.presentViewController(mainMenu, animated: true, completion: nil)
        }
    }
    
    private func result(){
        switch self.currentPlayer!.gameStatus(self.game!.dealer){
        case .Lost :
            self.currentPlayer!.lose()
            self.updatePlayerCards()
            self.updatePlayersBalances()
            self.gameInfo.text = "You lost this round!"
            self.infoBGAnimation()
            if self.lastPlayer(){
                self.game!.setDealersTurn(true)
            }
            self.nextPlayer()
            if self.currentPlayer!.money < 1 {
                self.gameInfo.text = "Game Over!"
                self.infoBGAnimation()
            }
        case .Push :
            self.currentPlayer!.push()
            self.updatePlayerCards()
            self.updatePlayersBalances()
            self.gameInfo.text = "Push!"
            self.infoBGAnimation()
            self.nextPlayer()
        case .Blackjack :
            self.currentPlayer!.winBlackjack()
            self.updatePlayerCards()
            self.updatePlayersBalances()
            self.gameInfo.text = "You won with a Blackjack!"
            self.infoBGAnimation()
            self.nextPlayer()
        case .Win :
            self.currentPlayer!.win()
            self.updatePlayerCards()
            self.updatePlayersBalances()
            self.gameInfo.text = "Congratulations! You won this round!"
            self.infoBGAnimation()
            self.nextPlayer()
        default :
            if self.currentPlayer!.turnStatus != .Dealer {
                self.currentTask.text = "Would you like to hit, stand or double?"
                self.currentPlayer!.turnStatus = .HitStand
                self.gamePlayWindow()
            }
        }
    }
    
    private func dealersTurn(){
        self.game!.dealer.openCards()
        self.updateDealerCards()
        while self.game!.dealer.totalCardValue() < 17{
            self.game!.dealer.hit(self.game!.shoe)
            self.updateDealerCards()
        }
        self.result()
        self.nextPlayer()
    }
    
    private func turn(){
        switch self.currentPlayer!.turnStatus {
        case .Start:
            self.betWindow()
        case .Bet:
            self.checkPlacedBet()
        case .HitStand:
            self.gamePlayWindow()
        default:
            println("meh")
        }
    }
    
    private func run(){
        self.playerIndex %= self.game!.players.count
        self.game!.players[self.playerIndex].turn = true
        self.currentPlayer = self.game!.players[self.playerIndex]
        if self.currentPlayer!.turn {
            if !self.game!.dealersTurn() {
                if self.currentPlayer!.gameStatus(self.game!.dealer) != .Lost {
                    self.turn()
                } else {
                    self.gamePlayWindow()
                    self.gameInfo.text = "You lost this round!"
                    self.infoBGAnimation()
                    self.nextPlayer()
                }
            } else {
                self.gamePlayWindow()
                self.dealersTurn()
                if self.lastPlayer() {
                    self.currentTask.text = "Tap the screen for a new round!"
                    self.newRound()
                }
            }
        }
    }

}
