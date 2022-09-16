//
//  ImageManager.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/17.
//

import SwiftUI

struct ImageManager {
    
    static func uiImage(from url: URL) -> UIImage{
        guard let data = try? Data(contentsOf: url) else {
            return UIImage(named: "animalface_suzume")!
        }
        print("-----")
        print(data)
        return UIImage(data: data) ?? UIImage(named: "animalface_suzume")!
    }
}
