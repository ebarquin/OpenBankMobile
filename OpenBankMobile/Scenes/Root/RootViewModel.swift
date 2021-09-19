//
//  RootViewModel.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 15/9/21.
//

import RxSwift
import RxCocoa

class RootViewModel {
    
    private let superHeroesRepository: SuperHeroesRepository
    private let disposeBag = DisposeBag()
    
    init(superHeroesRepository: SuperHeroesRepository) {
        self.superHeroesRepository = superHeroesRepository
    }
    
    func fetchSuperHeroes() {
        superHeroesRepository.fetchSuperHeroes().subscribe { response in
            switch response {
            case .next(let response):
                if let response = response {
                    let superHeroes = response.data.results.map { $0.mapped()}
                }
                
            case .error(let error):
                print(error.localizedDescription)
            default: break
            }
        }.disposed(by: disposeBag)
    }
}
