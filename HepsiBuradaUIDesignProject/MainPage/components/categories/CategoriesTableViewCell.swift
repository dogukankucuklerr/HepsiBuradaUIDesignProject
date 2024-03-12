//
//  CategoriesTableViewCell.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 7.03.2024.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categoriesList = [Categories]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configureData()
        addData()
        configureCollectionViewLayout()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //---------------------------
    private func customNibs() {
        let categoryCollectionCellNib: UINib = UINib(nibName: "CategoriesCollectionView", bundle: nil)
        collectionView.register(categoryCollectionCellNib, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    //--------------------------
    private func addData() {
        let categoryData = [
            ("Market ve Su", "category1"),
            ("Oynadıkça Kazan", "category2"),
            ("Elektronik", "category3"),
            ("Hemen Başvur", "category4"),
            ("Alışverişe Başla", "category5"),
            ("Ramazan Alışverişi", "category6"),
            ("Hepsipay", "category7"),
            ("Honor Magic V2", "category8"),
            
        ]
        
        for (categoryName, imageName) in categoryData {
            let category = Categories(category_id: categoriesList.count + 1, category_name: categoryName, category_image: imageName)
            categoriesList.append(category)
        }
    }

    //--------------------------------------

    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 7

        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 10 * 5) / 4

        layout.itemSize = CGSize(width: itemWidth, height: itemWidth )
        layout.sectionInset = UIEdgeInsets(top: 3, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true

    }
   
}
//-----------------------------------------

extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
            let category = categoriesList[indexPath.row]
                cell.categoryImage.image = UIImage(named: category.category_image!)
                cell.categoryName.text = category.category_name!
               return cell
        }
        return UICollectionViewCell()
    }
    
}

