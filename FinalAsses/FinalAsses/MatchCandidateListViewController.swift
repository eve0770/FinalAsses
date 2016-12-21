//
//  MatchCandidateListViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class MatchCandidateListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
//        {
//        didSet
//        {
//            tableView.dataSource = self
//        }
//    }
    
var users = [Users]()

    override func viewDidLoad() {
        super.viewDidLoad()
        frDBref = FIRDatabase.database().reference()
        fetchUsersInfo()
        
    }
    
    func fetchUsersInfo()
    {
        FIRDatabase.database().reference().child("users").observe(.childAdded, with: {(snapshot) in
            
            
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                
                let user = Users()
                user.setValuesForKeys(dictionary)
                print(user.name!, user.age!)
            }
            
//            let allUser = Users()
//
//            guard let timeDictionary = snapshot.value as? [String: AnyObject]
//            else
//            {
//                return
//            }
//            let userUID = timeDictionary["name"]
//            print("user found")
//            print(snapshot)
        }, withCancel: nil)
    

    }


    
    @IBAction func matchedListButt(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "ListMatchProfile", sender: self)
    }

    @IBAction func ListProfileButt(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "ListProfile", sender: self)
    }

}

//extension MatchCandidateListViewController : UITableViewDataSource
//{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
