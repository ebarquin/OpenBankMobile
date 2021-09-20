//
//  DetailViewModel.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 20/9/21.
//

import RxSwift
import RxCocoa

class DetailViewModel{
    private let superHeroesRepository: SuperHeroesRepository
    let id: Int
    let disposeBag = DisposeBag()
    let superHero = BehaviorRelay<SuperHero?>(value: nil)
    private let loadInProgress = BehaviorRelay<Bool>(value: false)
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged()
    }
    
    init(superHeroesRepository: SuperHeroesRepository, id: Int) {
        self.id = id
        self.superHeroesRepository = superHeroesRepository
    }
    
    func fetchData() {
        fetchSuperHero(id: self.id)
    }
    
    func fetchSuperHero(id: Int) {
        self.loadInProgress.accept(true)
        superHeroesRepository.fetchSuperHero(for: id).subscribe { response in
            self.loadInProgress.accept(false)
            switch response {
            case .next(let response):
                if let response = response {
                    let superHeroes = response.data.results.map { $0.mapped()}
                    self.superHero.accept(superHeroes.first)
                }
            case .error(let error):
                print(error.localizedDescription)
            default: break
            }
        }.disposed(by: disposeBag)
        
    }
}
