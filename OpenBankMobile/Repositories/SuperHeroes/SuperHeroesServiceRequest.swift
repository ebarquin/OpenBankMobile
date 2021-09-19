//
//  SuperHeroesServiceRequest.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 19/9/21.
//

import Alamofire

enum SuperHeroesServiceRequest {
    case fetchSuperHeroes
}

extension SuperHeroesServiceRequest: APIConfiguration {
    var method: HTTPMethod {
        switch self {
        case .fetchSuperHeroes:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchSuperHeroes:
            
            let ts = String(Date().timeIntervalSince1970)
            let hash = MD5.MD5Hex(data: MD5.MD5(string: ts + Constants.privateKey + Constants.publicKey)).lowercased()
            return "v1/public/characters?ts=\(ts)&apikey=\(Constants.publicKey)&hash=\(hash)"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchSuperHeroes:
            return nil
        }
    }
}
