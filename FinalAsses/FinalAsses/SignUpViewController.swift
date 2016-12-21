//
//  SignUpViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController{


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButton(_ sender: UIButton)
    {
        //later change to delegate type
        self.dismiss(animated: true, completion: nil)
    }


    @IBAction func createAccountButton(_ sender: UIButton)
    {
        let mc = self.storyboard?.instantiateViewController(withIdentifier: "MatchCandidate") as! MatchCandidateListViewController
        present(mc, animated: true, completion: nil)
    }

    @IBAction func backButton(_ sender: UIBarButtonItem)
    {
        let nav = navigationController
        nav?.popViewController(animated: true)
    }
}
