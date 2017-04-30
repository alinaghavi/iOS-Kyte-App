//
//  CitiesTableViewController.swift
//  WarehouseApp
//
//  Created by Ali on 1/23/1396 AP.
//  Copyright © 1396 Kyte. All rights reserved.
//

import UIKit
import Alamofire

class CitiesTableViewController: UITableViewController {
    var citiesNames = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()        
        
        let parameters: Parameters = [
            "parent": "IR",
            ]
        Alamofire.request("http://kyte.ir/api/v1/regions/" , method: .get, parameters: parameters)
            .responseJSON { response in
                let array = response.result.value as? [Any]
                
                self.tableView.beginUpdates()
                
                for object in array! {
                    if let region = object as? [String: Any] {
                        if let name = region["name"] as? String {
                            self.citiesNames.append(name)
                            
                            let indexPath:IndexPath = IndexPath(row:(self.citiesNames.count - 1), section:0)
                            
                            self.tableView.insertRows(at: [indexPath], with: .left)
                            
                        }
                    }
                }
                
                self.tableView.endUpdates()
        }
        
        
        tableView.estimatedRowHeight = 50

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citiesNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            self.tableView.dequeueReusableCell(withIdentifier:
                "CitiesTableCell", for: indexPath)
                as! CitiesTableViewCell
        
        let row = indexPath.row
        cell.citiesLabel.font =
            UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.citiesLabel.text = citiesNames[row]
         return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
