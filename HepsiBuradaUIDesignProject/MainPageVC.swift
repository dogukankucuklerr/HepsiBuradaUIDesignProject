//
//  ViewController.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 5.03.2024.
//

import UIKit

class MainPageVC: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var konumView: UIView!
    
    @IBOutlet weak var premiumView: UIView!
    
    @IBOutlet weak var hepsiPayView: UIView!
    
    
    @IBOutlet weak var qrCodeView: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //-----------------------------
       
        
        
        
        //------------------------
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        customNibs()
        //--------------------------
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        navigationController?.setNavigationBarHidden(true, animated: true)
            // Tab bar itemlarının seçili durumdaki metin rengini ayarla
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        UITabBar.appearance().tintColor = .orange
        
            //searchbar kismi burasi
            let colors: [UIColor] = [.red, .blue, .purple, .green, .orange]
            let barHeight: CGFloat = 5
            let barWidth = searchBar.frame.width / CGFloat(colors.count)
        
            var xOffset: CGFloat = searchBar.frame.origin.x
        for color in colors {
            let colorBar = UIView(frame: CGRect(x: xOffset, y: searchBar.frame.maxY - 45, width: barWidth, height: barHeight))
            colorBar.backgroundColor = color
            view.addSubview(colorBar)
            xOffset += barWidth
        }
        
            searchBar.backgroundColor = .white
            searchBar.barTintColor = .white
            searchBar.searchTextField.backgroundColor = .white
            
            //burasi da konumview ayarlama
            konumView.layer.borderWidth = 0.5
            konumView.layer.borderColor = UIColor.systemGray4.cgColor
            konumView.layer.cornerRadius = 5
            
            //premiumview ayarlama
            premiumView.layer.cornerRadius = 10
            
            // hepsipayview ayarlama
            hepsiPayView.layer.cornerRadius = 10
            
            // qrcodeview ayarlama
            qrCodeView.layer.cornerRadius = 10
            
    //------------------------------------------------------------------------------------------
            
           
        
        
        
        func customNibs() {
            let sliderCellNib: UINib = UINib(nibName: "SliderTableView", bundle: nil)
            tableView.register(sliderCellNib, forCellReuseIdentifier: "SliderTableViewCell")
            let categoryCellNib: UINib = UINib(nibName: "CategoriesTableView", bundle: nil)
            tableView.register(categoryCellNib, forCellReuseIdentifier: "CategoriesTableViewCell")
            let sliderTwoCellNib: UINib = UINib(nibName: "SliderTwoTableView", bundle: nil)
            tableView.register(sliderTwoCellNib, forCellReuseIdentifier: "SliderTwoTableViewCell")
            let specialCellNib: UINib = UINib(nibName: "SpecialTableView", bundle: nil)
            tableView.register(specialCellNib, forCellReuseIdentifier: "SpecialTableViewCell")
            
        }
       
        
        
    }
   
   
 
  
    //------------------------
    
 
}
extension MainPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as? SliderTableViewCell {
                return cell
            }
        }else if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as? CategoriesTableViewCell {
                return cell2
            }
        } else if indexPath.section == 2 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: "SliderTwoTableViewCell", for: indexPath) as? SliderTwoTableViewCell {
                return cell3
            }
        } else if indexPath.section == 3 {
            if let cell4 = tableView.dequeueReusableCell(withIdentifier: "SpecialTableViewCell", for: indexPath) as? SpecialTableViewCell {
                return cell4
            }
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 145
        } else if indexPath.section == 1 {
            return 200
        } else if indexPath.section == 2 {
            return 210
        } else if indexPath.section == 3 {
            return 80
        }
        return 0
    }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 4
        }
    }

