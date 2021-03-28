//
//  PlayersViewController.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 27/03/21.
//

import UIKit
import Foundation
import SDWebImage

class PlayersViewController: UIViewController {

    var playersArray : [EmpaticaPlayer] = []
    @IBOutlet weak var tablePlayers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPlayers()
    }
    
    func getPlayers(){
        NetworkManager.shared.provider.request(.empatica, completion: { result in
            switch result {
            case .success(let response):
                self.playersArray = ParserManager.shared.parsePlayersResponse(response)
                print("Players:",self.playersArray)
                self.tablePlayers.reloadData()
            case .failure(let failure):
//                TODO: show alert error
                print("Request Error:", failure.errorDescription as Any)
            }
        })
    }

}
//MARK: Delegate

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tablePlayers.delegate = self
        tablePlayers.dataSource = self
        
        tablePlayers.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerTableViewCell")
        
        tablePlayers.rowHeight = 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        
        cell.playerLabel.text = playersArray[indexPath.row].name.first+" "+playersArray[indexPath.row].name.last
        cell.playerImage.sd_setImage(with: URL(string: playersArray[indexPath.row].picture.thumbnail), completed: nil)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//      TODO identify player by indexPathRow
        var sessionVC : SessionViewController = storyboard?.instantiateViewController(identifier: "SessionViewController") as! SessionViewController
        
        sessionVC.playerSelected = playersArray[indexPath.row]
        sessionVC.indexPlayer = indexPath.row
        
        self.navigationController?.pushViewController(sessionVC, animated: true)
        
    }
    
}
