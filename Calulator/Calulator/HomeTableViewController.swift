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
    
    
    let fatSecretClient = FatSecretClient()
    //var food = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("***********")
        fatSecretClient.getFood(id: "4384") { food in
            print(food)
        }
        print("***********")
    }

    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
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
                let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
               
                delegate.window?.rootViewController = loginViewController
    }
}
