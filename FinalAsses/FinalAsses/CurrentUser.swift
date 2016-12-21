//
//  CurrentUser.swift
//  FinalAsses
//
//  Created by Students on 12/21/16.
//  Copyright © 2016 Calvin.kl. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class User {
    var name : String
    var email : String
    var age : String
    var gender: String
    var description : String
    var profilepicurl : String
    
    init() {
        self.name = ""
        self.age = ""
        self.gender = ""
        self.email = ""
        self.description = ""
        self.profilepicurl = ""
    }
    
    func initWithCurrentUser(completion: @escaping (() -> ())) {
        guard let user = FIRAuth.auth()?.currentUser else {
            print("User not signed in.")
            return
        }
        
        let userDatabaseReference = FIRDatabase.database().reference(withPath: "users/\(user.uid)")
        
        userDatabaseReference.observe(FIRDataEventType.value, with: { (snapshot) in
            guard let userRawDataDictionary = snapshot.value as? [String: AnyObject] else { return }
            
            self.name = userRawDataDictionary["name"] as! String
            self.email  = userRawDataDictionary["email"] as! String
            self.age = userRawDataDictionary["age"] as! String
            self.description = userRawDataDictionary["description"] as! String
            self.gender = userRawDataDictionary["gender"] as! String
            self.profilepicurl = userRawDataDictionary["profilepic"] as! String
            
        })
    }
}
