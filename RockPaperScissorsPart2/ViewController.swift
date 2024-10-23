//
//  ViewController.swift
//  RockPaperScissorsPArt2
//
//  Created by Nidhin Nishanth on 10/17/24.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet var opponentLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    
    @IBOutlet var playAgainButton: UIButton!
    
    // viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(for: .start)
    }
    
    //Actions - these are triggered when I tap a button to play a round
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(userMove: Move(sign: .rock))
    }
    
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        play(userMove: Move(sign: .paper))
    }
    
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(userMove: Move(sign: .scissors))
    }
    
    // when we want to play again, we'll update the screen to start a new round
    @IBAction func playAgainButton(_ sender: UIButton) {
        updateUI(for: .start)
    }
    
    
    // Extra Functions - updateUI() and play()
    
    // updates the screen as we play the game
    func updateUI(for state: GameState) {
        statusLabel.text = state.statusText
        
        // we'll check what state we're and update the screen accordingly.
        // for the most part, we'll just change the background color
        switch state {
        case .win:
            view.backgroundColor = .systemGreen
        case .lose:
            view.backgroundColor = .systemRed
        case .draw:
            view.backgroundColor = .lightGray
        case .start:
            //here's how to create a custom color
            view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
            
            // when we start a new round, we'll update some of the labels and buttons
            
            // Control + command + space for emoji keyboard
            opponentLabel.text = "🤖🤖"
            
            // we'll hide the playAgain button and bring back the move buttons
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        }
    }
    
    // simulates a round of Rock Paper Scissors
    func play(userMove: Move) {
    
        // we've passed in our selected move. now our opponent needs to make a move.
        // we'll generate a random move for our opponent and figure out the outcome
        let computerMove = randomMove()
        let outcome = userMove.outcome(against: computerMove)
        
        // we will update the UI using the outcome of this round
        updateUI(for: outcome)
        
        // update the screen - change the label and hide/disable the buttons
        opponentLabel.text = computerMove.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        playAgainButton.isHidden = false
        
        // now that we've hidden all the buttons, let's bring back the one we used to make our move
        switch userMove.sign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorsButton.isHidden = false
        }
    }
 
}

