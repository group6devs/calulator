//
//  HomeTableViewController.swift
//  Calulator
//
//  Created by Dunyagozel Durdyyeva on 11/16/22.
//

import UIKit
import Parse
import FatSecretSwift
import Alamofire

class HomeTableViewController: UITableViewController {
    
    var foodArray = [[String: Any?]]()
    var foodNameVal = ""
    var caloriesVal = Int()
    
    let searchController = UISearchController()
    
    var posts = [PFObject]()
    var selectedPost : PFObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        loadFood()
        
        self.tableView.reloadData()
       
        
       

    }

    // MARK: - Table view data source
    @objc func loadFood() {
        let headers: HTTPHeaders = [ "x-app-id": "c3fe7ec6", "x-app-key": "a3d93fe9ddacf3a2419dbbebd5d3f532" ]
        AF.request("https://trackapi.nutritionix.com/v2/search/instant?query=apple", headers: headers).responseData { response
            in
            
            switch response.result {
                
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    
                    self.foodArray = jsonObject["branded"] as! [[String : Any?]]
                
                    
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
                
                
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
             
        
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodCellTableViewCell
      
        if(foodArray.count > 0) {
            foodNameVal = (foodArray[indexPath.row]["food_name"] as? String ?? "nil")
            caloriesVal = (foodArray[indexPath.row]["nf_calories"] as? Int ?? 0)
            
            cell.foodName.text = foodNameVal
            cell.calories.text = String(caloriesVal)
            
        }
        
        
        return cell
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    

    @IBAction func onAddButton(_ sender: Any) {

        let logs = PFObject(className: "Logs")
        
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
        
        logs["user"] = PFUser.current()!
        logs["FoodName"] = (foodArray[indexPath.row]["food_name"] as? String ?? "nil")
        
        logs["Calories"] = String((foodArray[indexPath.row]["nf_calories"] as? Int ?? 0))
        logs.saveInBackground { (success, error) in
            if success {
                print("Saved")
            } else {
                print("Error")
            }
            
        }
    }
    
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let
                        delegate = windowScene.delegate as? SceneDelegate else {return}
                delegate.window?.rootViewController = loginViewController
    }
    
}
