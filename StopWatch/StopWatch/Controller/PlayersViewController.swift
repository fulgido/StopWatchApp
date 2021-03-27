//
//  PlayersViewController.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 27/03/21.
//

import UIKit
import Foundation

class PlayersViewController: UIViewController {

    var playersArray : [EmpaticaPlayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getPlayers()
    }
    
    func getPlayers(){
        NetworkManager.shared.provider.request(.empatica, completion: { result in
            switch result {
            case .success(let response):
                self.playersArray = ParserManager.shared.parsePlayersResponse(response)
                print("Players:",self.playersArray)
            case .failure(let failure):
//                TODO: show alert error
                print("Request Error:", failure.errorDescription as Any)
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
