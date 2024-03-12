//
//  SliderTwoTableViewCell.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 9.03.2024.
//

import UIKit

class SliderTwoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sliderTwoDataList = [Slider]()
    
    
    
    
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
    //--------------------
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    //------------------------
    
    private func customNibs() {
        let sliderTwoCollectionCellNib: UINib = UINib(nibName: "SliderTwoCollectionView", bundle: nil)
        collectionView.register(sliderTwoCollectionCellNib, forCellWithReuseIdentifier: "SliderTwoCollectionViewCell")
    }
    
    //-----------------------------
    
    private func addData() {
        let sliderTwoData = [
            "bottomslider4",
            "bottomslider1",
            "bottomslider2",
            "bottomslider3"
        ]
        
        for imageName in sliderTwoData {
            let s1 = Slider(image_id: sliderTwoDataList.count + 1, image_name: imageName)
            sliderTwoDataList.append(s1)
        }
    }
    //------------------------------
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
       
        layout.sectionInset = UIEdgeInsets(top: 3 , left: 10, bottom: 10, right: 10)
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
extension SliderTwoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderTwoDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderTwoCollectionViewCell", for: indexPath) as? SliderTwoCollectionViewCell {
            let slider = sliderTwoDataList[indexPath.row]
               cell.imageView.image = UIImage(named: slider.image_name!)
               return cell
        }
        return UICollectionViewCell()
    }
    
}

