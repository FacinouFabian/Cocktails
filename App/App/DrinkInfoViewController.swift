//
//  DrinkInfoViewController.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//

import UIKit

class DrinkInfoViewController: UIViewController {
    @IBOutlet weak var drinknameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var drink: Drink?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let drink = self.drink {
            self.drinknameLabel.text = drink.strDrink
        }
    }

}
