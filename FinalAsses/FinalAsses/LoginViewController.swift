//
//  ViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class LoginViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func logInButton(_ sender: UIButton)
    {
        performSegue(withIdentifier: "MatchList", sender: self)
    }
    
    
    @IBAction func signUpButton(_ sender: UIButton)
    {
    }
    

}

