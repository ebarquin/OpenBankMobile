//
//  RootViewController.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 15/9/21.
//

import UIKit
import RxSwift

class RootViewController: UIViewController, StoryboardInitiable{
    static var storyboardName: String = "RootView"
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var viewModel: RootViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel?.fetchSuperHeroes()
    }
    
    
    private func bindTableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel?
            .superHeroes
            .bind(to: tableView
                    .rx
                    .items(cellIdentifier: "cell")) {_, superHero, cell in
                if let cellToUse = cell as? SuperHeroCell {
                    cellToUse.configureCell(with: superHero)
                }
            
            }.disposed(by: disposeBag)
    }
    
    private func bindIsLoading() {
        viewModel?.onShowLoadingHud
        .map { [weak self] in self?.isLoadingVisible($0) }
        .subscribe()
        .disposed(by: disposeBag)
    }

    private func bindViewModel() {
        bindTableView()
        bindIsLoading()
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

extension RootViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
}

