//
//  SpecialTableViewCell.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 10.03.2024.
//

import UIKit

class SpecialTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var specialList = [Special]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         configureData()
         addData()
         configureCollectionViewLayout()
         customNibs()    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //----------------------------------
    
    private func customNibs() {
        let specialCollectionCellNib: UINib = UINib(nibName: "SpecialCollectionView", bundle: nil)
        collectionView.register(specialCollectionCellNib, forCellWithReuseIdentifier: "SpecialCollectionViewCell")
    }
    
    //-------------------------------------
    private func addData() {
        let specialData = [
            ("Sana Özel Fırsatlar", "20+ kupon fırsatı var","greenstar"),
            ("Tüm Kategoriler", "Keşfetmeye başla","kategorifoto")
            
            
        ]
        
        for (specialName, specialName2, specialImageName) in specialData {
            let special = Special(special_id: specialList.count + 1, special_name: specialName, special_name2: specialName2, special_image: specialImageName)
            specialList.append(special)
            
        }
    }
    
    //------------------------------------------
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10

        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2

        layout.itemSize = CGSize(width: itemWidth, height: (itemWidth / 3) - 10)
        layout.sectionInset = UIEdgeInsets(top: 3, left: 10, bottom: 0, right: 10)
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true

    }
  

}
extension SpecialTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return specialList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecialCollectionViewCell", for: indexPath) as? SpecialCollectionViewCell {
            let special = specialList[indexPath.row]
                cell.specialImageView.image = UIImage(named: special.special_image!)
                cell.specialTopLabel.text = special.special_name!
                cell.specialBottomLabel.text = special.special_name2!
            
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 0.3
            cell.layer.cornerRadius = 8
            
               return cell
        }
        return UICollectionViewCell()
    }
    
}
