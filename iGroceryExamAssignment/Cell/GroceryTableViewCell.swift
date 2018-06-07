//
//  GroceryTableViewCell.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 24/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//

import UIKit



class GroceryTableViewCell: UITableViewCell {

    

    @IBOutlet weak var groceryImage: UIImageView!
    @IBOutlet weak var groceryName: UILabel!
    @IBOutlet weak var groceryDesc: UILabel!
    @IBOutlet weak var addToCartLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        groceryImage.layer.cornerRadius = groceryImage.bounds.height / 2
        groceryImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
  
    }
    
    // add data to labels in cell
    func set(groceries: Grocery){
        groceryName.text = groceries.gName
        
        let convert = groceries.gDesc
        // covert date downloaded from stack overflow
        // covert date
        func convertTimestamp(covert: Double) -> String {
            let converted = covert / 1000
            let date = NSDate(timeIntervalSince1970: converted)
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm a"
            formatter.dateStyle = .long
            formatter.timeStyle = .medium

            return formatter.string(from: date as Date)
        }

        groceryDesc.text = "In Store since:" + convertTimestamp(covert: convert)


    
        }
}

