//
//  ParserManager.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 27/03/21.
//

import Foundation
import Moya
import SwiftyJSON

class ParserManager {
    
    static let shared = ParserManager()
    
    let decoder: JSONDecoder = JSONDecoder.init()
    
    func parsePlayersResponse(_ response: Moya.Response) -> [EmpaticaPlayer] {
        
        var players : [EmpaticaPlayer] = []
        
        do {
            
            let resultJSON = try JSON(response.mapJSON())["results"]
            
            for index in 0...resultJSON.count-1 {
                let playerData : Data = try resultJSON[index].rawData()
                
                let decoder: JSONDecoder = JSONDecoder.init()
                let player : EmpaticaPlayer = try decoder.decode(EmpaticaPlayer.self, from: playerData)

                players.append(player)
            }
        
        } catch let error {
            print(error)
        }
        
        return players
    }
    
}
