//
//  SessionsManager.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 28/03/21.
//

import Foundation

//In this first protoype of the app, I need a singleton to save player's single session
class SessionsManager {
    
    static let shared : SessionsManager = SessionsManager()

//  Players
    var players : [EmpaticaPlayer] = []

//  All players Sessions
    var playersSessions : [[PlayerSession]] = [[]]
    
//  Sessions of a single Player
    var playerSessions : [PlayerSession] = []
    
}
