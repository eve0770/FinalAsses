//
//  MatchCandidateListViewController.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import UIKit

class MatchCandidateListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func matchedListButt(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "ListMatchProfile", sender: self)
    }

    @IBAction func ListProfileButt(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "ListProfile", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
