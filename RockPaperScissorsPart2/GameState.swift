//
//  GameState.swift
//  RockPaperScissorsPArt2
//
//  Created by Nidhin Nishanth on 10/17/24.
//

import Foundation

// to determine the state of our current game - are we starting a new round, or have we already won/lost/drawn?
enum GameState {
    case win, lose, draw
    case start
    
    // we'll use this computed property to check what GameState we're in and return a message accordingly
    var statusText: String {
        switch self {
        case .win:
            return "Wow you won"
        case .lose:
            return "Of course the human lost"
        case .draw:
            return "this won't happen again buddy"
        case .start:
            return "play a round... if you dare"
        }
    }
}
