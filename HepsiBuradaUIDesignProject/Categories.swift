//
//  Categories.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 7.03.2024.
//

import Foundation


class Categories {
    var category_id: Int?
    var category_name: String?
    var category_image: String?
    
    init(category_id: Int, category_name: String, category_image: String) {
        self.category_id = category_id
        self.category_name = category_name
        self.category_image = category_image
    }
}
