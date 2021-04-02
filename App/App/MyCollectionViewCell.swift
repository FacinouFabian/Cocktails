//
//  MyCollectionViewCell.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: MyContentView!
    
    static var shared = MyCollectionViewCell()
}
