//
//  SecondViewController.swift
//  To Do List
//
//  Created by Harry Ferrier on 8/4/16.
//  Copyright © 2016 CASTOVISION LIMITED. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // Set up the UIClass outlets that we need for use within the code..
    @IBOutlet weak var successfullyAddedLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var dismissSuccessfullyAddedLabelButton: UIButton!
    
    
    
    
    
    
    
    
    // Function when 'x' button is clicked on the successfullyAddedLabel bar..
    @IBAction func dismissSuccessfullyAddedLabel(_ sender: AnyObject) {
        
        successfullyAddedLabel.isHidden = true
        dismissSuccessfullyAddedLabelButton.isHidden = true
        
    }
    
    
    
    
    
    
    
    
    
    
    // '+' button is pressed by user and new to do list item is to be saved...
    @IBAction func saveItem(_ sender: AnyObject) {
        
        
        // Grab the core saved data from the userDefaults which is stored under the key "items"
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        // Create an itemsArray variable, which is a class array of strings.
        var itemsArray: [String]
        
        // If the objects stored within core data are convertable to an array of strings...save to a constant named 'temporaryItems'
        if let temporaryItems = itemsObject as? [String] {
            
            // Fill the itemsArray up with the values stored in the temporaryItems constant
            itemsArray = temporaryItems
        
            // Append the value which the user has inputted into the textField to the itemsArray..
            itemsArray.append(userTextField.text!)
            
            // Show label bar which displays that adding to do list item has been successful.
            successfullyAddedLabel.isHidden = false
            dismissSuccessfullyAddedLabelButton.isHidden = false
        
        // If the file was not convertable to an array of strings..
        } else {
        
            // Just set the itemsArray to be the value of the userTextField text value.
            itemsArray = [userTextField.text!]
        
        }
        
        // Update the values stored in core data to be the same as the newly appended itemsArray.
        UserDefaults.standard.set(itemsArray, forKey: "items")
        
        // Wipe the value from the userTextField so that the user can easily input another item if they need to.
        userTextField.text = ""
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // Set a UITapGestureRecognizer on the view itself, and if a gesture is recognizer, call the "dismissKeyboard" method.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
        // hide the successfullyAddedLabel and it's dismiss button at the beginning of the app loading.
        successfullyAddedLabel.isHidden = true
        dismissSuccessfullyAddedLabelButton.isHidden = true
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

