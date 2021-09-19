//
//  RootViewController.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 15/9/21.
//

import UIKit
import RxSwift

class RootViewController: UIViewController, StoryboardInitiable {
    static var storyboardName: String = "RootView"
    
    var viewModel: RootViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchSuperHeroes()
    }
    
}
