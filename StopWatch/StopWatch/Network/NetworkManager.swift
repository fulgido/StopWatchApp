//
//  NetworkManager.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 27/03/21.
//

import Moya

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let provider = MoyaProvider<RandomUser>()
    
}
