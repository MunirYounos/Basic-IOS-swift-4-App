//
//  GroceryListViewController.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 24/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//

import UIKit
import Firebase

class GroceryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
  // Back button which go back to home view
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  // my data array
    var groceries = [Grocery]()
    
    
    
  // in code tableView for Grocery lists
    var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //instantiate table view
        tableView = UITableView(frame: view.bounds, style: .plain)
        //tableView.backgroundColor = UIColor.yellow
        
        // cell identifier
        let cellId = UINib(nibName: "GroceryTableViewCell", bundle: nil)
        tableView.register(cellId, forCellReuseIdentifier: "GroceryCell")
        view.addSubview(tableView)

        var layoutGuide: UILayoutGuide!
        layoutGuide = view.safeAreaLayoutGuide
        
        // In code constraints
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true

        // Reload data
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.reloadData()
        
        // observe firebase function for adding to it
        observeGroceries()
 
    }
    
    //firebase
    func observeGroceries() {
        let groceryRef = Database.database().reference().child("groceriesListFB")
        groceryRef.queryOrdered(byChild: "timeIndicator").observe(.value, with: { snapshot in
            
            var tempArrayOfGroceries = [Grocery]()
            
            for child  in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let text = dict["text"] as? String,
                    let timeIndicator = dict["timeIndicator"] as? Double {
                    
                    let groceries = Grocery(id: childSnapshot.key, isAddToCart: false, gName: text, gDesc: timeIndicator)
                    // sorted data
                    tempArrayOfGroceries.insert(groceries, at: 0)
                }
            }
            
            self.groceries = tempArrayOfGroceries
            self.tableView.reloadData()
        })
    }

    
    // Table Rows 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroceryCell", for: indexPath) as! GroceryTableViewCell
        cell.set(groceries: groceries[indexPath.row])
        return cell
        
    }
    
}


