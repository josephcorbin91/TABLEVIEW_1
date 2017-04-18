//
//  TableViewController.swift
//  TABLEVIEW_1
//
//  Created by user125303 on 4/14/17.
//  Copyright © 2017 JCO. All rights reserved.
//

import UIKit
protocol MyProtocol
{
    func setDynamicVelocity(dynamicVelocity: [Double])
}
class TableViewController: UITableViewController, UITextFieldDelegate {

    
    var items = [Double]()
        var myProtocol: MyProtocol?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "Dynamic Velocities"
            
            tableView.register(MyCell.self, forCellReuseIdentifier: "cellId")
               tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
        tableView.sectionHeaderHeight = 50
           
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Insert", style: .plain, target: self, action: "insert")
            
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: "done")
        }
        
    
   
   
    func done(){
        if(verifyDataPressureRule()){
        var returnArray = Array(items[0..<items.count])
        myProtocol?.setDynamicVelocity(dynamicVelocity: returnArray)
        self.navigationController?.popViewController(animated: true)
        
    }
        else{
            let alertInvalidResult = UIAlertController(title: "Invalid Pressure values", message: "75% of values must be greater than 10% of the maximum pressure", preferredStyle: UIAlertControllerStyle.alert)
            alertInvalidResult.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertInvalidResult, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    func verifyDataPressureRule() -> Bool {
        print("VERIFY DATA CALLED")
        print(items)
        var currentMax = Double(items[0])
        for i in 0..<items.count{
            var currentVelocity = Double(items[i])
            if(currentVelocity > currentMax){
                currentMax=currentVelocity
            }
        }
        var acceptablePressureValues = 0.0
        for i in 0..<items.count{
            var currentVelocity = Double(items[i])
            
            if(currentVelocity > 0.1 * currentMax){
                acceptablePressureValues += 1
            }
        }
        var percentageOfAcceptableValues = acceptablePressureValues/Double(items.count)
        
        print(percentageOfAcceptableValues)
        print(items)
        print("CURRENT MAX")
        print(currentMax)
        return percentageOfAcceptableValues >= 0.75
        
    }
     func insert() {

        
      
                let textField = self.view.viewWithTag(3) as! UITextField
                if let text = textField.text, !text.isEmpty
                {
                    
                    
                    items.append(Double(text)!)
                    textField.text = ""
                    print("ITEMS COUNT")
                    print(items.count)
                    print(items)
                    
                    let insertionIndexPath = NSIndexPath(row: items.count-1, section: 0)
                    tableView.beginUpdates()
                    tableView.insertRows(at: [insertionIndexPath as IndexPath], with: .top)
                    tableView.endUpdates()
             }
        
            

        
    }
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        
    class Header: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.tag = 3
        textField.placeholder = "Enter dynamic pressure"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.boldSystemFont(ofSize: 14)
        return textField
    }()
    
    func setupViews() {
        textField.becomeFirstResponder()
        addSubview(textField)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textField]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": textField]))
        
    }
    
}
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       /* if(indexPath.row == 0){
           var cell = self.tableView.dequeueReusableCell(withIdentifier: "DynamicVelocityTextFieldCell", for: indexPath) as! DynamicVelocityTextFieldCell
           
      
            cell.dynamicVelocityTextField.delegate = self // theField is your IBOutlet UITextfield in your custom cell
            
            
            
            
return cell
        }
        else{
            */
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MyCell
        myCell.nameLabel.text = String(items[indexPath.row])
        myCell.myTableViewController = self
        return myCell
       // }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")

    }
    
        
        func deleteCell(cell: UITableViewCell) {
            if let deletionIndexPath = tableView.indexPath(for: cell) {
                items.remove(at: deletionIndexPath.row)
                tableView.deleteRows(at: [deletionIndexPath], with: .left)
            }
        }
        
    }

    class MyCell: UITableViewCell {
        
        var myTableViewController: TableViewController?
        
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Sample Item"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 14)
            return label
        }()
        
        let actionButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Delete", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        func setupViews() {
            addSubview(nameLabel)
            addSubview(actionButton)
            
            actionButton.addTarget(self, action: #selector(MyCell.handleAction), for: .touchUpInside)
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-8-[v1(80)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1": actionButton]))
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": actionButton]))
            
        }
        
        func handleAction() {
            myTableViewController?.deleteCell(cell: self)
        }
        
    }
  
