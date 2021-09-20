//
//  SuperHeroCell.swift
//  OpenBankMobile
//
//  Created by Eugenio Barquín on 20/9/21.
//

import UIKit
import SDWebImage

class SuperHeroCell: UITableViewCell {
    @IBOutlet private weak var superHeroImage: UIImageView!
    @IBOutlet private weak var superHeroNameLabel: UILabel!
    
    var superHero: SuperHero?
    
    func configureCell(with superHero: SuperHero) {
        self.superHeroNameLabel.text = superHero.name
        superHeroImage.sd_setImage(with: URL(string: superHero.imageUrl), placeholderImage: UIImage(named: "superheroPlaceHolder"), options: .continueInBackground, context: nil)
        self.superHero = superHero
    }
}

