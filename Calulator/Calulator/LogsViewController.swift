//
//  LogsViewController.swift
//  Calulator
//
//  Created by Huy Le on 11/25/22.
//

import UIKit
import Parse

class LogsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var totalCals: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var logs = [PFObject]()
    var total = Int()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogsCell") as! LogsCell
        let eachLog = logs[indexPath.row]
        cell.foodNameLog.text = eachLog["FoodName"] as! String
        cell.caloriesLog.text = eachLog["Calories"] as! String
        total = total + Int(eachLog["Calories"] as! String)! ?? 0
        totalCals.text = String(total)
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Logs")
        query.includeKey("user")
        query.limit = 20
        total = 0
        query.findObjectsInBackground{ (logs, error) in
            if logs != nil {
                self.logs = logs!
                self.tableView.reloadData()
            }
            
        }
        
        
    }

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onRemoveButton(_ sender: Any) {
        
        var superview = (sender as AnyObject).superview
            while let view = superview, !(view is UITableViewCell) {
                    superview = view?.superview }
                guard let cell = superview as? UITableViewCell else {
                    print("button is not contained in a table view cell")
                    return
                    
                }
                guard let indexPath = tableView.indexPath(for: cell) else {
                    print("failed to get index path for cell containing button")
                    return
                    
                }
    
                var removeLog = [PFObject]()
                removeLog = [logs[indexPath.row]]

                PFObject.deleteAll(inBackground: (removeLog)) { (sucess, error) in
                    if (sucess){
                        print("Removed")
                    } else{
                        print("Error")
                        
                    }
                    
                }

        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
