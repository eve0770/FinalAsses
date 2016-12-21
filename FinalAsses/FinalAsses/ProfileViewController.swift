//
//  ProfileViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
var frDBref : FIRDatabaseReference!

class ProfileViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var userAgeText: UITextField!
    @IBOutlet weak var userGenderText: UITextField!
    @IBOutlet weak var userEmailText: UITextField!

    var ref : FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        fetchUserInfo()
        // Do any additional setup after loading the view.
    }
    
    func fetchUserInfo()
    {
       let newUser = User()
        newUser.initWithCurrentUser{ () -> () in
            self.userNameText.text = "\(newUser.name)"
            self.userAgeText.text = "\(newUser.age)"
            self.userEmailText.text = "\(newUser.email)"
        }
    }
    

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func MatchCandidateButt(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "ProfileList", sender: self)
    }

    @IBAction func MatchedProfileButt(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "ProfileMatchProfile", sender: self)
    }
    
    @IBAction func editButton(_ sender: UIButton)
    {
        performSegue(withIdentifier: "ProfileEdit", sender: self)
    }
    
    @IBAction func signOutButton(_ sender: UIButton)
    {
       
            let popUp = UIAlertController(title: "Log Out", message: "yes or no", preferredStyle: .alert)
            let noButton = UIAlertAction(title: "NO", style: .cancel, handler: nil)
            let yesButton = UIAlertAction(title: "YES", style: .default){ (action) in
                do
                {
                    try FIRAuth.auth()?.signOut()
                    
                }
                catch let logoutError {
                    print(logoutError)
                }
                self.notifySuccessLogout()
            }
            popUp.addAction(noButton)
            popUp.addAction(yesButton)
            present(popUp, animated: true, completion: nil)
        
        
        let nav = UINavigationController()
        nav.popToRootViewController(animated: true)
            
        }
        
    func notifySuccessLogout()
        {
            let UserLogoutNotification = Notification (name: Notification.Name(rawValue: "UserLogoutNotification"), object: nil, userInfo: nil)
            NotificationCenter.default.post(UserLogoutNotification)
        }


}
