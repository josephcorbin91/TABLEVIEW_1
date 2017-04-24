//
//  TableViewControllerSettings.swift
//  TABLEVIEW_1
//
//  Created by user125303 on 4/24/17.
//  Copyright © 2017 JCO. All rights reserved.
//

import UIKit

class TableViewControllerSettings: UITableViewController {
    var InputTitles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        InputTitles = ["Enable Sound","Enable Vibration", "Enable GPS Localization of Duct"]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let rightButtonItem = UIBarButtonItem.init(
            title: "Done",
            style: .done,
            target: self,
            action: "rightButtonAction:"
        )
        
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        
    }
    func rightButtonAction(sender: UIBarButtonItem){
     
        let inputViewController = storyboard?.instantiateViewController(withIdentifier: "mainViewCotroller") as! ViewController
        
        
        self.navigationController?.pushViewController(inputViewController, animated: true)
 
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return InputTitles.count
    }

    func switchPressed(sender:UISwitch){
        
        if(sender.tag == 0){
            if(sender.isOn){
            }
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0 && indexPath.row == 0){
            
            let cell : UITableViewCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchSound", for: indexPath)
            cell.textLabel?.text = InputTitles[indexPath.row]
            var switchView : UISwitch
            switchView = UISwitch(frame: CGRect.zero)
            switchView.tag = indexPath.row
            
            
            cell.accessoryView = switchView
            switchView.addTarget(self, action: #selector(switchPressed(sender:)), for: UIControlEvents.valueChanged)
        return cell
            
        }
        else if(indexPath.section == 0 && indexPath.row == 1){
            
            let cell : UITableViewCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchGPS", for: indexPath)
            cell.textLabel?.text = InputTitles[indexPath.row]
            var switchView : UISwitch
            switchView = UISwitch(frame: CGRect.zero)
            switchView.tag = indexPath.row
            
            
            cell.accessoryView = switchView
            switchView.addTarget(self, action: #selector(switchPressed(sender:)), for: UIControlEvents.valueChanged)
                      return cell
            
        }
        else{//if(indexPath.section == 0 && indexPath.row == 2){
            
            let cell : UITableViewCell
            cell = self.tableView.dequeueReusableCell(withIdentifier: "defaultSwitchVibration", for: indexPath)
            cell.textLabel?.text = InputTitles[indexPath.row]
            var switchView : UISwitch
            switchView = UISwitch(frame: CGRect.zero)
            switchView.tag = indexPath.row
            
            
            cell.accessoryView = switchView
            switchView.addTarget(self, action: #selector(switchPressed(sender:)), for: UIControlEvents.valueChanged)
            return cell
            
        }
    }
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

