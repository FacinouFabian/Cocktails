//
//  DrinksViewController.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//

import UIKit

class DrinksViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var data: Drinks?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: self.collectionView.bounds.width, height: 120)
        }
    }

    override func viewDidLoad() {
        self.collectionView?.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        APIDrinksManager.shared.drinks { (drinks) -> (Void) in
            if let drinks = drinks {
                self.data = drinks
                self.collectionView?.reloadData()
                print(drinks)
            } else {
                print("Could not fetch drinks")
            }
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UICollectionViewCell else { return }
        
        if let index = self.collectionView?.indexPath(for: cell)?.row {
            if let viewController = segue.destination as? DrinkInfoViewController {
                viewController.drink = self.data?.drinks[index]
            }
        }
    }

}

extension DrinksViewController {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 2
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.drinks.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        let drink = self.data?.drinks[indexPath.row]
        
        cell.view.label.text = drink?.strDrink ?? "No name"
        
//        let url = URL(string: drink?.strDrinkThumb ?? "")!
//
//        if let data = try? Data(contentsOf: url) {
//            // Create Image and Update Image View
//            cell.view.imageView.image = UIImage(data: data)
//        }
        
        return cell
    }
}

extension DrinksViewController {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}
