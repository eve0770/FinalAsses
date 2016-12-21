//
//  MatchedProfileViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit

class MatchedProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func MatchListButton(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "MatchProfileList", sender: self)
    }

    @IBAction func ToProfileButt(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "MatchProfileProfile", sender: self)
    }

}
