//
//  SessionViewController.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 28/03/21.
//

import UIKit

class SessionViewController: UIViewController {

    var playerSelected : EmpaticaPlayer?
    var indexPlayer : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let playerName = playerSelected?.name.first
        self.navigationItem.title = playerName
        self.navigationItem.backButtonTitle = ""
    }

}
