//
//  SuperHeroesResponse+mapper.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 19/9/21.
//

extension SuperHeroResponse {
    func mapped() -> SuperHero {
        return SuperHero(imageUrl:addExtensionTo(imageUrl: self.thumbnail.path), name: self.name, superHeroDescription: self.description)
    }
    
    private func addExtensionTo(imageUrl: String) -> String {
        let http = imageUrl
        let https = "https" + http.dropFirst(4)
        return "\(https).jpg"
    }
}
