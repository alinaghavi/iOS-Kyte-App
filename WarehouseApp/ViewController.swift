//
//  ViewController.swift
//  WarehouseApp
//
//  Created by Ali on 1/17/1396 AP.
//  Copyright © 1396 Kyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ShipmentViewController {
            destinationViewController.shipmentNumber = shipmentNumberText.text
        }
    }
    
    //Mark: Properties
    
    @IBOutlet weak var shipmentNumberText: UITextField!

    //Mark: Actions

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
