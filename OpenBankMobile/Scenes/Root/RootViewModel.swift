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
    let superHeroes = BehaviorRelay<[SuperHero]>(value: [])
    private let loadInProgress = BehaviorRelay<Bool>(value: false)
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged()
    }
    
    init(superHeroesRepository: SuperHeroesRepository) {
        self.superHeroesRepository = superHeroesRepository
    }
    
    func fetchSuperHeroes() {
        loadInProgress.accept(true)
        superHeroesRepository.fetchSuperHeroes().subscribe { response in
            self.loadInProgress.accept(false)
            switch response {
            case .next(let response):
                if let response = response {
                    let superHeroes = response.data.results.map { $0.mapped()}
                    self.superHeroes.accept(superHeroes)
                }

            case .error(let error):
                print(error.localizedDescription)
            default: break
            }
        }.disposed(by: disposeBag)
    }
}
