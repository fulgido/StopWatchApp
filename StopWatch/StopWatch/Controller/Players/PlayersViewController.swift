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

    @IBOutlet weak var tablePlayers: UITableView!
    
    let sessionsManager = SessionsManager.shared
    
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
                self.sessionsManager.players = ParserManager.shared.parsePlayersResponse(response)
                print("Players:",self.sessionsManager.players)
                
                self.tablePlayers.reloadData()
            case .failure(let failure):
//                TODO: show alert error
                print("Request Error:", failure.errorDescription as Any)
            }
        })
    }

}
//MARK: Delegate e DataSource

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tablePlayers.delegate = self
        tablePlayers.dataSource = self
        
        tablePlayers.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerTableViewCell")
        
        tablePlayers.rowHeight = 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sessionsManager.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        
        cell.playerLabel.text = self.sessionsManager.players[indexPath.row].name.first+" "+self.sessionsManager.players[indexPath.row].name.last
        cell.playerImage.sd_setImage(with: URL(string: self.sessionsManager.players[indexPath.row].picture.thumbnail), completed: nil)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var sessionVC : SessionViewController = storyboard?.instantiateViewController(identifier: "SessionViewController") as! SessionViewController
        
        sessionVC.playerSelected = self.sessionsManager.players[indexPath.row]
        sessionVC.indexPlayer = indexPath.row
        
        self.navigationController?.pushViewController(sessionVC, animated: true)
        
    }
    
}
