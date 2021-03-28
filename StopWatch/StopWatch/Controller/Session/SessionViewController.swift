//
//  SessionViewController.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 28/03/21.
//

import UIKit

class SessionViewController: UIViewController {
    
    @IBOutlet weak var tablePlayerSession: UITableView!
    
    let sessionsManager = SessionsManager.shared
    
    var playerSelected : EmpaticaPlayer?
    var indexPlayer : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupTable()
    }
    
    func setupNavigationBar() {
        let playerName = playerSelected?.name.first
        self.navigationItem.title = playerName
        self.navigationItem.backButtonTitle = ""
    }

}

//MARK: Delegate

extension SessionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTable(){
        tablePlayerSession.delegate = self
        tablePlayerSession.dataSource = self
        
        tablePlayerSession.register(UINib(nibName: "SessionTableViewCell", bundle: nil), forCellReuseIdentifier: "SessionTableViewCell")
        
        tablePlayerSession.rowHeight = 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sessionsManager.playersSessions.count == 1 {
//          It would be empty...
            return 0
        } else if sessionsManager.playersSessions[indexPlayer!].isEmpty {
            return 0
        } else {
            return sessionsManager.playersSessions[indexPlayer!].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionTableViewCell", for: indexPath) as! SessionTableViewCell
        
        return cell
        
    }
    
}


