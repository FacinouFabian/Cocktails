//
//  DrinkInfoViewController.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//

import UIKit

class DrinkInfoViewController: UIViewController {
    var drink: Drink?
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var measuresLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let drink = self.drink {
            nameLabel.text = drink.strDrink
            ingredientsLabel.text = drink.ingredients.joined(separator: "\n")
            measuresLabel.text = drink.measures.joined(separator: "\n")
            instructionsLabel.text = drink.strInstructions
            drinkImageView.fetchImage(from: URL(string: drink.strDrinkThumb))
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        print("Back clicked")
        dismiss(animated: true, completion: nil)
    }

}
