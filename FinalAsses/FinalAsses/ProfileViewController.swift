//
//  ProfileViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit

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
}
