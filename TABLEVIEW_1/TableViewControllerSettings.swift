//
//  TableViewControllerSettings.swift
//  TABLEVIEW_1
//
//  Created by user125303 on 4/24/17.
//  Copyright © 2017 JCO. All rights reserved.
//

import UIKit
import CoreLocation

class TableViewControllerSettings: UITableViewController,CLLocationManagerDelegate {
    var InputTitles = [String]()
    var inputArrayValues = Array(repeating: "", count: 3)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEW DID LOAD VIEW SETTINGS")
        print(inputArrayValues)

        InputTitles = ["Enable Sound","Enable Vibration", "Enable GPS Localization of Duct"]//,//"Language"]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return InputTitles.count
    }

    func switchPressed(sender:UISwitch){
            if(sender.tag == 0){
            if(sender.isOn){
                UserDefaults.standard.set("on", forKey: "switch0") //Bool

                print("GPS SELECTED")
                
            }
            else{
                print("GPS SELECTED")
                UserDefaults.standard.set("off", forKey: "switch0") //Bool



            }
        }
        if(sender.tag == 1){
            if(sender.isOn){
                UserDefaults.standard.set("on", forKey: "switch1") //Bool
/*
                print("GPS SELECTED")
                var locManager = CLLocationManager()
                locManager.delegate = self
                locManager.requestWhenInUseAuthorization()
*/
                
            }
            else{
                print("GPS SELECTED")
                /*
                var locManager = CLLocationManager()
                locManager.delegate = self
                locManager.requestWhenInUseAuthorization()
                 */
                UserDefaults.standard.set("off", forKey: "switch1") //Bool
 

            }
        }
        if(sender.tag == 2){
            if(sender.isOn){
                UserDefaults.standard.set("on", forKey: "switch2") //Bool

                print("GPS SELECTED")
                inputArrayValues[2]="on"

            }
            else{
                print("GPS SELECTED")
                inputArrayValues[2]="off"
                UserDefaults.standard.set("off", forKey: "switch2") //Bool

             
                
            }
        }

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            
            let cell : UITableViewCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchSound", for: indexPath)
            cell.textLabel?.text = InputTitles[indexPath.row]
            var switchView : UISwitch
            switchView = UISwitch(frame: CGRect.zero)
            switchView.tag = indexPath.row
            
            
            cell.accessoryView = switchView
            if(UserDefaults.standard.string(forKey: "switch0")==nil){
                UserDefaults.standard.set("off", forKey: "switch0")
            }
            else if(UserDefaults.standard.string(forKey: "switch0")=="on"){
                switchView.setOn(true, animated: false)
            }
            switchView.addTarget(self, action: #selector(switchPressed(sender:)), for: UIControlEvents.valueChanged)
        return cell
        }
     
        else if(indexPath.row == 1){
            
            let cell : UITableViewCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchGPS", for: indexPath)
            cell.textLabel?.text = InputTitles[indexPath.row]
            var switchView : UISwitch
            switchView = UISwitch(frame: CGRect.zero)
            switchView.tag = indexPath.row
            print("TAG OF SWITCH VIEW")
            print(switchView.tag)
            cell.accessoryView = switchView
            if(UserDefaults.standard.string(forKey: "switch1")==nil){
                UserDefaults.standard.set("off", forKey: "switch1")
            }
            else if(UserDefaults.standard.string(forKey: "switch1")=="on"){
                switchView.setOn(true, animated: false)
            }
            switchView.addTarget(self, action: #selector(switchPressed(sender:)), for: UIControlEvents.valueChanged)
                      return cell
            
        }
        else if(indexPath.row == 2){
            
            let cell : UITableViewCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchVibration", for: indexPath)
            cell.textLabel?.text = InputTitles[indexPath.row]
            var switchView : UISwitch
            switchView = UISwitch(frame: CGRect.zero)
            switchView.tag = indexPath.row
            
            
            cell.accessoryView = switchView
            if(UserDefaults.standard.string(forKey: "switch2")==nil){
                UserDefaults.standard.set("off", forKey: "switch2")
            }
            else if(UserDefaults.standard.string(forKey: "switch2")=="on"){
                switchView.setOn(true, animated: false)
            }
            switchView.addTarget(self, action: #selector(switchPressed(sender:)), for: UIControlEvents.valueChanged)
            return cell
            
        }
            else if(indexPath.row == 3){
                
                let cell : UITableViewCell
                cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchWorld", for: indexPath)
                cell.textLabel?.text = InputTitles[indexPath.row]
                return cell
                
                }
                else if(indexPath.row == 4){
                    
                    let cell : UITableViewCell
                    cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchTheory", for: indexPath)
                    cell.textLabel?.text = InputTitles[indexPath.row]
                    return cell
                    
                    }
                    else {
                        
                        let cell : UITableViewCell
                        cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchUpdates", for: indexPath)
                        cell.textLabel?.text = InputTitles[indexPath.row]
                           return cell
                        
                        }


    
}
    
}
