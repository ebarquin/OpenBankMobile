//
//  DetailViewController.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 20/9/21.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class DetailViewController: UIViewController, StoryboardInitiable {
    static var storyboardName: String = "DetailView"
    @IBOutlet weak var superHeroImage: UIImageView!
    @IBOutlet weak var superHeroInfoLabel: UILabel!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    
    var viewModel: DetailViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel?.fetchData()
    }
    
    private func bindViewModel() {
        viewModel?.superHero.subscribe(onNext: { superHero in
            guard let superHero = superHero else { return }
            self.superHeroImage.sd_setImage(with: URL(string: superHero.imageUrl), placeholderImage: UIImage(named: "superheroPlaceHolder"), options: .continueInBackground, context: nil)
            let superHeroDescription = superHero.superHeroDescription == "" ? "No description" : superHero.superHeroDescription
            self.superHeroInfoLabel.text = superHeroDescription
        }).disposed(by: disposeBag)
    }
    
    private func isLoadingVisible(_ visible: Bool) {
        if visible {
            spinner.isHidden = false
            spinner.startAnimating()
        } else {
            spinner.isHidden = true
            spinner.stopAnimating()
        }
    }
}
