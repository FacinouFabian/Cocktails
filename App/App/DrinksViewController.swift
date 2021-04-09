//
//  DrinksViewController.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//
import SkeletonView
import UIKit

class DrinksViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var data: Drinks? {
        willSet {
            print(newValue)
        }
        
        didSet {
            self.collectionView.reloadData()
        }
    }
    private var refreshControl = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
    
    override func viewDidLoad(){
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        self.collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshControl.tintColor = UIColor.init(hex: "#f50057ff")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UICollectionViewCell else { return }
        
        if let index = self.collectionView?.indexPath(for: cell)?.row {
            if let viewController = segue.destination as? DrinkInfoViewController {
                viewController.drink = self.data?.drinks[index]
            }
        }
    }

    @objc private func refreshData() {
        APIDrinksManager.shared.drinks { (drinks) -> (Void) in
            if let drinks = drinks {
                self.data = drinks
                
            } else {
                print("Could not fetch drinks")
            }
            self.refreshControl.endRefreshing()
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


extension DrinksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout
        
        let space: CGFloat = (flowlayout?.minimumInteritemSpacing ?? 0.0) + (flowlayout?.sectionInset.left ?? 0.0) + (flowlayout?.sectionInset.right ?? 0.0)
        var size:CGFloat =  (collectionView.frame.size.width - space) / 2.0
        if UIDevice.current.model.hasPrefix("iPad") {
            size = (collectionView.frame.size.width - space) / 4.0
        }

        return CGSize(width: size, height: size * 1.5)

    }
}
