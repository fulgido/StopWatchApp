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

}
//MARK: Delegate

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        
        return cell
        
    }
    
}
