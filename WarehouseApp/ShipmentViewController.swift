//
//  ShipmentViewController.swift
//  WarehouseApp
//
//  Created by Ali on 1/27/1396 AP.
//  Copyright © 1396 Kyte. All rights reserved.
//

import UIKit
import Alamofire

class ShipmentViewController: UIViewController {

    @IBOutlet weak var shipmentNumberLabel: UILabel!
    
    @IBOutlet weak var shipmentStateLabel: UILabel!
    
    @IBOutlet weak var shipmentWeightLabel: UILabel!
    
    @IBOutlet weak var shipmentSenderName: UILabel!
    
    @IBOutlet weak var shipmentSenderAddress: UILabel!
    
    @IBOutlet weak var shipmentServiceName: UILabel!
    
    @IBOutlet weak var shipmentServiceContent: UILabel!
    
    internal var shipmentNumber: String?
    
    
    
    @IBAction func SaveShipmentBtn(_ sender: Any) {

        let parameters = ["id":1669, "parcelWeight": 100, ]
        
        let headers: HTTPHeaders = [
            "X-Api-Key": "1gu93pllj7vo8w000w8sw8w8sogk84wsg4co0gcw8g0kg84480",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        Alamofire.request("https://kyte.ir/api/v1/shipments/quote",method: .post, parameters: parameters, headers: headers).responseJSON {
            response in
            print(response)


            let array = response.result.value as! [String: Any]
            
            for (key,value) in array {
                print("The Key is \(key) & The value is \(value)")
            }

        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shipmentNumberLabel.text = shipmentNumber

        let headers: HTTPHeaders = [
            "X-Api-Key": "1gu93pllj7vo8w000w8sw8w8sogk84wsg4co0gcw8g0kg84480",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]

        Alamofire.request("https://kyte.ir/api/v1/shipments/\(self.shipmentNumber!)",method: .get, headers: headers).responseJSON { response in
            let array = response.result.value as! [String: Any]

            for (key,value) in array {
                print("The Key is \(key) & The value is \(value)")
            }
            self.shipmentStateLabel.text = array["state"] as? String
            
            self.shipmentWeightLabel.text = String(describing: array["parcelWeight"] as! Int)
           // let temparray = array["address"] as! [String: Any]
           // print(temparray["name"] as! String)
            self.shipmentSenderName.text = (array["address"] as! [String: Any])["name"] as? String
            
            self.shipmentSenderAddress.text = ((array["address"] as! [String: Any])["region"] as! [String: Any])["summary"] as? String
           
            self.shipmentServiceName.text = (array["service"] as! [String: Any])["serviceName"] as?String

            self.shipmentServiceContent.text = array["contentClaim"] as? String

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
