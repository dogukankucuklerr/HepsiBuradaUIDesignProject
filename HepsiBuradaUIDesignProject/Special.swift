//
//  Special.swift
//  HepsiBuradaUIDesignProject
//
//  Created by Doğukan Küçükler on 10.03.2024.
//

import Foundation


class Special {
    var special_id: Int?
    var special_name: String?
    var special_name2: String?
    var special_image: String?
    
    init(special_id: Int, special_name: String,special_name2: String, special_image: String) {
        self.special_id = special_id
        self.special_name = special_name
        self.special_name2 = special_name2
        self.special_image = special_image
    }
}
