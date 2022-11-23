//
//  HomeTableViewController.swift
//  Calulator
//
//  Created by Dunyagozel Durdyyeva on 11/16/22.
//

import UIKit
import Parse
import FatSecretSwift

class HomeTableViewController: UITableViewController {
    
    var foodArray = [NSDictionary]()
    
    var numberOfFood: Int!
    
    let searchController = UISearchController()
    
    let fatSecretClient = FatSecretClient()
    //var food = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        loadFood()
        


    }

    // MARK: - Table view data source
   
    @objc func loadFood() {
        fatSecretClient.searchFood(name: "Hotdog") { search in
            for food in search.foods {
                //self.foodArray.append(["name" : food.name, "calories" : food.description])
                self.foodArray.append(["name" : food.name, "calories" : food.description])
                print(self.foodArray)
            }
          
        }
        //self.tableView.reloadData()
        print(self.foodArray.count)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodCellTableViewCell
        
        cell.foodName.text = (foodArray[indexPath.row]["name"] as? String)
        cell.calories.text = "123 kcal"
        
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodArray.count
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
