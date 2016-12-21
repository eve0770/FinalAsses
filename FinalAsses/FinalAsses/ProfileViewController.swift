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

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            
        }
        
    func notifySuccessLogout()
        {
            let UserLogoutNotification = Notification (name: Notification.Name(rawValue: "UserLogoutNotification"), object: nil, userInfo: nil)
            NotificationCenter.default.post(UserLogoutNotification)
        }


}
