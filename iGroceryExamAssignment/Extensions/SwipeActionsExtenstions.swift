//
//  SwipeActionsExtenstions.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 26/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//

import Foundation
import UIKit
import Firebase


extension GroceryListViewController {
    
    //swipe actions for delete and update of the firebase nodes  =====================================================================
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let updateRow = UIContextualAction(style: .normal, title: "") { (action, view, nil) in
            
            
            let groceries =  self.groceries[indexPath.row]
            let updateAlert = UIAlertController(title: groceries.gName , message:  " Update \(groceries.gName) to fresh products!", preferredStyle: .alert)
            let addAction = UIAlertAction(title: "Update", style: .default){(_) in
                
                let gId = groceries.id
                let timeIndicator = groceries.gDesc
                var gForUpdate = updateAlert.textFields?[0].text
                var gFromGrocery = groceries.gName
        
                    if (gForUpdate != "" && gForUpdate != gFromGrocery ){
                        updateGroceries(upid: gId, upName: gForUpdate! , upTimeIdicator: timeIndicator)
                    } else {

                        // alert if name already exists
                        let Alreadyalert = UIAlertController(title: "Oops! Field is either Empty or already Exist", message: "Please renew with fresh groceries", preferredStyle: UIAlertControllerStyle.alert)
                        Alreadyalert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle .default, handler: nil))
                        self.present(Alreadyalert, animated: true, completion: nil)
                        print("Rejected")
                }
        
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default){(_) in
                
            }
            
            updateAlert.addTextField(configurationHandler: { (textField) in
                textField.text = groceries.gName
            })
            updateAlert.addAction(addAction)
            updateAlert.addAction(cancelAction)
            self.present(updateAlert, animated: true, completion: nil)
            print(groceries.gName)
        }
        updateRow.backgroundColor = darkYellow
        updateRow.image = #imageLiteral(resourceName: "gIcon-update")
        updateRow.title = "Update"

        //update function
        func updateGroceries(upid: String, upName: String, upTimeIdicator:Double){
            let updateNewObject = [
                "id":upid,
                "text": upName,
                "timeIndicator": [".sv":"timestamp"]
                ] as [String:Any]
            let ref = Database.database().reference().child("groceriesListFB")
            ref.child(upid).setValue(updateNewObject)
        }
        
        let stopFullSwiping = UISwipeActionsConfiguration(actions: [updateRow])
        stopFullSwiping.performsFirstActionWithFullSwipe = false
        return stopFullSwiping
    }
    
    
    // delete swipe action =====================================================================
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        let addToCart = addToCartAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [ delete, addToCart])
    }
    
    //delete =====================================================================
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let delete = UIContextualAction(style: .destructive, title: "") { (action, view, nil) in
            
            let groceries =  self.groceries[indexPath.row]
            let deletAlert = UIAlertController(title: groceries.gName , message: "Are you sure \(groceries.gName) is out dated?", preferredStyle: .alert)
            let deletAction = UIAlertAction(title: "delete", style: .default){(_) in
                let gId = groceries.id
                deleteGroceries(id: gId)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default){(_) in
                
            }
            deletAlert.addAction(deletAction)
            deletAlert.addAction(cancelAction)
            self.present(deletAlert, animated: true, completion: nil)
        }
        
        func deleteGroceries(id: String){
            let ref = Database.database().reference().child("groceriesListFB")
            ref.child(id).setValue(nil)
        }
        
        delete.backgroundColor = rose
        delete.image = #imageLiteral(resourceName: "gIcon-delete")
        delete.title = "Delete"
        return delete
    }
    
    //add to cart swipe =====================================================================
    func addToCartAction(at indexPath: IndexPath) -> UIContextualAction {
        let groceries =  self.groceries[indexPath.row]
        let addToCart = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            groceries.isAddToCart = !groceries.isAddToCart
            completion(false)
        }
        addToCart.backgroundColor = groceries.isAddToCart ? CustomGreen : .lightGray
        addToCart.title = groceries.isAddToCart ? "Bought" : "Buy" 
        addToCart.image = groceries.isAddToCart ? #imageLiteral(resourceName: "gIcon-added") : #imageLiteral(resourceName: "gIcon-addtocart")
        
        return addToCart
    }//addto cartbutton
}
