//
//  SliderTableViewCell.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 7.03.2024.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sliderDataList = [Slider]()
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureData()
        configureCollectionViewLayout()
        customNibs()
        addData()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //-------------------------
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    //-------------------
    private func customNibs() {
        let sliderCollectionCellNib: UINib = UINib(nibName: "SliderCollectionView", bundle: nil)
        collectionView.register(sliderCollectionCellNib, forCellWithReuseIdentifier: "SliderCollectionViewCell")
    }
    //---------------------------
    private func addData() {
        let sliderData = [
            "topsliderimage1",
            "topsliderimage2"
            
        ]
        
        for imageName in sliderData {
            let s1 = Slider(image_id: sliderDataList.count + 1, image_name: imageName)
            sliderDataList.append(s1)
        }
    }
    
  
    //---------------------------
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
       
        layout.sectionInset = UIEdgeInsets(top: 10 , left: 10, bottom: 10, right: 10)
       // layout.minimumInteritemSpacing = 10
        //layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth - 20
        let screenHeight = collectionView.frame.size.height
        let itemHeight = screenHeight
        layout.itemSize = CGSizeMake(itemWidth, itemHeight);
        collectionView.collectionViewLayout = layout
        
    }
    
 
}
//------------------
extension SliderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as? SliderCollectionViewCell {
            let slider = sliderDataList[indexPath.row]
               cell.imageView.image = UIImage(named: slider.image_name!)
               return cell
        }
        return UICollectionViewCell()
    }
    
}
