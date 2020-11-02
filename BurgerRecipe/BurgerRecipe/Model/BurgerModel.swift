//
//  BurgerModel.swift
//  BurgerRecipe
//
//  Created by Dewangee Agrawal on 13/09/20.
//  Copyright © 2020 Dewangee Aggarwal. All rights reserved.
//

import Foundation

class BurgerModel {
    
    private(set) var burgers : [Burger] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "BurgerResources/burger", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                burgers = try JSONDecoder().decode([Burger].self, from: data)
            } catch{
                print(error)
            }
        }
    }
    
    func burgers(forType type : BurgerType?) -> [Burger] {
        guard let type = type else {return burgers}
        return burgers.filter {$0.type == type}
    }
    
    func add(burger: Burger) {
        burgers.append(burger)
    }
}
