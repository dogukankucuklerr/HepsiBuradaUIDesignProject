//
//  SliderCollectionViewCell.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 9.03.2024.
//


import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
    }
}
