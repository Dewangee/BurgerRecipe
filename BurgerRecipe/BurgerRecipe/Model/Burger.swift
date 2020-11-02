//
//  Burger.swift
//  BurgerRecipe
//
//  Created by Dewangee Agrawal on 13/09/20.
//  Copyright © 2020 Dewangee Aggarwal. All rights reserved.
//

import Foundation

struct Burger : Decodable {
    var name : String
    var ingredients : String
    var imageName : String
    var thumbnailName : String
    var type : BurgerType
}

enum BurgerType :String, Decodable{
    case vegetarian = "vegetarian"
    case meat = "meat"
}
