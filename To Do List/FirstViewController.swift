//
//  FirstViewController.swift
//  To Do List
//
//  Created by Harry Ferrier on 8/4/16.
//  Copyright © 2016 CASTOVISION LIMITED. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // Hook up the an object for the UITableView class in our Main.storyboard. This means that we can reload it's data..
    @IBOutlet weak var table: UITableView!
    
    // Create and initialize an empty array of string..
    var itemsArray = [String]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    
    
    
    
    
    
    
    // vieDidAppear function which loads everything for the page up before it loads.
    override func viewDidAppear(_ animated: Bool) {
        
        
        // Get data out of the Core Data on the phone, saved under the key "items"
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        // If the data is able to be cast to an array of strings, save the values to variable 'temporaryItems'
        if var temporaryItems = itemsObject as? [String] {
            
            // Fill the empty items array with the values from temporaryItems..
            itemsArray = temporaryItems
            
        }

        // Reload the data..
        table.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    
    // *** MEET REQUIREMENTS SPECIFIED BY UITableViewDataSource PROTOCOL *** //
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return same number of rows as items in the itemsArray
        return itemsArray.count
        
    }
    
    
    
    
    
    
    // Set up the cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create instance of UITableViewCell, of style .default and reuseIdentifier "Cell"
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        // Set each cell's default textLabel property with the value matching the corresponding view row's indexPath.
        cell.textLabel?.text = itemsArray[indexPath.row]
        
        // Return the cell
        return cell
    }
    
    // **** //
    
    
    
    
    
    
    
    
    
    
    
    // Make the rows deletable, using the commit editingStyle function..
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        // If the recognized editingStyle is the .delete editing style.
        if editingStyle == .delete {
        
            // Remove the item at that row's indexPath from the itemsArray..
            itemsArray.remove(at: indexPath.row)
            
            // Reload the table's data...this should re-count the itemsArray, see that it has 1 less item, and therefore display 1 less row..
            table.reloadData()
            
            // Set the updated value of the itemsArray to the key "items".
            UserDefaults.standard.set(itemsArray, forKey: "items")
        
        }
        
    }
    
}

