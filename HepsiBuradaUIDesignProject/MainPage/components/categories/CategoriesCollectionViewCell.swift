//
//  CategoriesCollectionViewCell.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 9.03.2024.
//
import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
  
    
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.backgroundColor = .white
        categoryImage.layer.cornerRadius = 5
    }
}
