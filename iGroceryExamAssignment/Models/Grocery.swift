//
//  Grocery.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 24/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//

import Foundation

// my data class stucture
class Grocery {
    
    var id:String
    //var gImage:String
    var isAddToCart:Bool
    var gName:String
    var gDesc:Double
    
    init( id:String,isAddToCart:Bool, gName:String, gDesc:Double) {
        self.id = id
        self.gName = gName
        self.gDesc = gDesc
        self.isAddToCart = isAddToCart
    }
}
