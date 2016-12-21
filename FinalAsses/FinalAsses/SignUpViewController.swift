//
//  SignUpViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController{

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!

    @IBOutlet weak var cr8AccountButt: UIButton!
    @IBOutlet weak var upd8Butt: UIButton!
    
    
    
    
    var messageReceive = ""
    
    var ref = FIRDatabase.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        if messageReceive == "Login"
        {
            cr8AccountButt.isHidden = false
            upd8Butt.isHidden = true
        }
        else if messageReceive == "Profile"
        {
            cr8AccountButt.isHidden = true
            upd8Butt.isHidden = false
        }
        
        
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard()))
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButton(_ sender: UIButton)
    {
        
    }


    @IBAction func createAccountButton(_ sender: UIButton)
    {
        if emailText.text != "" || passwordText.text != "" || nameText.text != ""
        {
            FIRAuth.auth()?.createUser(withEmail: emailText.text!, password: passwordText.text!) {(user, error) in
                if error != nil
                {
                    print(error!)
                }
                
                guard let uid = user?.uid else
                {
                    return
                }
                    let userReference = self.ref.child("users").child(uid)
                    let userData = ["age": self.ageText.text!,
                                    "description": self.descriptionText.text!,
                                    "email": self.emailText.text!,
                                    "gender": self.genderText.text!,
                                    "name": self.nameText.text!,
                                    "profilepic": ""]
                    userReference.updateChildValues(userData, withCompletionBlock: { (err, ref) in
                        if err != nil
                        {
                            print(err)
                            return
                        }
                    let mc = self.storyboard?.instantiateViewController(withIdentifier: "MatchCandidate") as! MatchCandidateListViewController
                    self.present(mc, animated: true, completion: nil)
                    })
                }
                
            }
        
        
        
        
        
    }
    

    @IBAction func backButton(_ sender: UIBarButtonItem)
    {
        let nav = navigationController
        nav?.popViewController(animated: true)
    }
    
}
