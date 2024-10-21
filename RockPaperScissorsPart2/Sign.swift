//
//  Sign.swift
//  RockPaperScissorsPArt2
//
//  Created by Nidhin Nishanth on 10/17/24.
//

import Foundation

//Sign enum => to allow us to choose between our three moves
// we'll learn about these enumerations more later
enum Sign {
    case rock
    case paper
    case scissors
}

// Move enum => how we can play the game
// sign property to keep track of the choice we make for our move
// emoji property to display our move
// outcome() method to check our move against an opponent's move
struct Move {
    var sign: Sign
    
    // Shortcut for emoji keyboard is:
    // Control+Command+Space
    var emoji: String {
        // we look at our sign to figure out with emoji to display
        switch sign {
        case .rock:
            return "👊" //fist
        case .paper:
            return "✋" // raised hand
        case .scissors:
            return "✌️"  // peace sign
        }
    }
    
    // to decide the outcome of our game, we compare our Move to our opponent's Move and return the GameState
    func outcome(against opponent: Move) -> GameState {
        //tied => if I make the same move as the opponent
        if self.sign == opponent.sign {
            return .draw
        }
        
        // win => if I make a specific move to beat the enemy
        switch self.sign {
        case .rock:
            if opponent.sign == .scissors {
                return .win
            }
        case .paper:
            if opponent.sign == .rock {
                return .win
            }
        case .scissors:
            if opponent.sign == .paper {
                return .win
            }
        }
        
        // lose => if we haven't won or tied by now, we've probably lost...
        return .lose
    }
}
