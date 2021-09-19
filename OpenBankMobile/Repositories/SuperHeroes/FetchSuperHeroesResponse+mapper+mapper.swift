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
        return "\(imageUrl).jpg"
    }
}
