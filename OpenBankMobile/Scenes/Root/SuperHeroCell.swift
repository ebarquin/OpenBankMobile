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
    
    
    func configureCell(with: SuperHero) {
        self.superHeroNameLabel.text = with.name
        superHeroImage.sd_setImage(with: URL(string: with.imageUrl), placeholderImage: UIImage(named: "superheroPlaceHolder"), options: .continueInBackground, context: nil)
    }
}

