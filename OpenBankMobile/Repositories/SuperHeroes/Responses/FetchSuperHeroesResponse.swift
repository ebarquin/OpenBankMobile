//
//  FetchSuperHeroesResponse.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 19/9/21.
//

struct FetchSuperHeroesResponse: Codable {
    let code: Int
    let data: SuperHeroDataResponse
}

struct SuperHeroDataResponse: Codable {
    let results: [SuperHeroResponse]
}

struct SuperHeroResponse: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: SuperHeroThumbnailResponse
}

struct SuperHeroThumbnailResponse: Codable {
    let path: String
}
