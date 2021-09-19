//
//  FetchSuperHeroesRequestParams.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 19/9/21.
//

struct FetchSuperHeroesRequestParams: Codable {
    var limit: Int
    var hash: String
    var apikey: String
    var ts: String
}
