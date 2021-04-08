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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        APIDrinksManager.shared.drinks { (drinks) -> (Void) in
            if let drinks = drinks {
                self.data = drinks
                self.collectionView?.reloadData()
                
            } else {
                print("Could not fetch drinks")
            }
        }
    }
    
    override func viewDidLoad(){
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        self.collectionView.setCollectionViewLayout(layout, animated: true)
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.drinks.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CocktailCollectionViewCell
        
        cell.configure(with: self.data?.drinks[indexPath.row])
        
        return cell
    }
}

extension DrinksViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}

extension DrinksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout
        
        let space: CGFloat = (flowlayout?.minimumInteritemSpacing ?? 0.0) + (flowlayout?.sectionInset.left ?? 0.0) + (flowlayout?.sectionInset.right ?? 0.0)
        
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        

        return CGSize(width: size, height: size * 1.5)

    }
}
