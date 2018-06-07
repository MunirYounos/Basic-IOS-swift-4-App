//
//  NewGroceryViewController.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 24/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//
import Foundation
import UIKit
import Firebase
class NewGroceryViewController: UIViewController, UITextViewDelegate {

    
    
    @IBOutlet weak var placeHolderText: UILabel!
    @IBOutlet weak var trashBtn: UIBarButtonItem!
    @IBOutlet weak var groceryTextView: UITextView!
    
    
    
    @IBAction func handleFBdata(_ sender: UIBarButtonItem) {
        
        
        let groRef = Database.database().reference().child("groceriesListFB").childByAutoId()
        let GroceryObject = [
            "id": groRef.key,
            "text": groceryTextView.text,
            "timeIndicator": [".sv":"timestamp"]
            
            ] as [String:Any]
        
        groRef.setValue(GroceryObject, withCompletionBlock: {error, ref in
            if error == nil {
               self.dismiss(animated: true, completion: nil)
            } else {
                //error
            }
            
        })

        
    }
    
    
    @IBAction func handleTrashBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        groceryTextView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            super.dismiss(animated: flag, completion: completion)
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        groceryTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groceryTextView.becomeFirstResponder()
        
        //Remove the navigation shadow
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    func textViewDidChange(_ textView: UITextView){
        placeHolderText.isHidden = !textView.text.isEmpty
    }


}
