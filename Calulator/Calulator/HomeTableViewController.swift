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
    
    let searchController = UISearchController()
    
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
            cell.foodName.text = (foodArray[indexPath.row]["food_name"] as? String)
            cell.calories.text = (foodArray[indexPath.row]["nf_calories"] as? String)
            
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


    
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let
                        delegate = windowScene.delegate as? SceneDelegate else {return}
                delegate.window?.rootViewController = loginViewController
    }
    
}
