//
//  RandomUser.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 27/03/21.
//

//endpoint to random user api
import Moya

public enum RandomUser {
    
    case empatica
    
}

extension RandomUser: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://randomuser.me/api/")!
    }
    
    public var path: String {
        switch self {
        case .empatica: return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .empatica: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
      }

    public var task: Task {
        switch self {
//      filter for empatica parameters
        case .empatica:
        return .requestParameters(
          parameters: [
            "seed": "empatica",
            "inc": "name,picture",
            "gender": "male",
            "results": "10",
            "noinfo": ""],
            encoding: URLEncoding.queryString)
        }
    }

    public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
    return .successCodes
    }
}
