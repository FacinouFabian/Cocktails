//
//  MyCollectionViewCell.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//

import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with drink: Drink?) {
        guard let drink = drink else { return }
        
        self.nameLabel.text = drink.strDrink
        
        print(drink.ingredients)
        
        if let url = URL(string: drink.strDrinkThumb){
            if let data = try? Data(contentsOf: url) {
                // Create Image and Update Image View
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.backgroundColor = UIColor.systemBackground

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.6
        self.imageView.layer.cornerRadius = 10
    }
}
