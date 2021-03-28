//
//  SessionViewController.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 28/03/21.
//

import UIKit
import Charts

class SessionViewController: UIViewController {
    
    @IBOutlet weak var distanceField: UITextField!
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var clearLapButton: UIButton!
    
    @IBOutlet weak var chartView: MarkerView!
    
    @IBOutlet weak var tablePlayerSession: UITableView!
    
    var isSessionStarted : Bool = false
    
//  TODO: create a timer
    
    let sessionsManager = SessionsManager.shared
    
    var playerSelected : EmpaticaPlayer?
    var indexPlayer : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupTable()
        setupChart()
    }
    
    func setupNavigationBar() {
        let playerName = playerSelected?.name.first
        self.navigationItem.title = playerName
        self.navigationItem.backButtonTitle = ""
    }
    
    func setupChart() {
        self.chartView.layer.borderWidth = 1.0
        self.chartView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func playStopAction(_ sender: Any) {
//        TODO: change icon when pressed
//        TODO: check id distance is != empty && is a number
        if isSessionStarted {
//            TODO: stop session
        } else {
//            TODO: start session - start timer
        }
    }
    
    @IBAction func clearLapAction(_ sender: Any) {
        if isSessionStarted {
//            TODO: lapAction
        } else {
//            TODO: clearAction
        }
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


