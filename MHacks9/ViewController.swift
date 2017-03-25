//
//  ViewController.swift
//  MHacks9
//
//  Created by Deetpanshu Malik on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//
import UIKit
import FacebookCore
import FacebookLogin
import Firebase

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let accessToken = AccessToken.current {
      // User is logged in, use 'accessToken' here.
      //what segues do we want here???
    }
  }
  
  @IBAction func signInClicked(_ sender: UIButton) {
    print("Clicked")
    
    
    //You typically should check if AccessToken.current already contains the permissions you need before asking to reduce unnecessary app switching
    
    
    let loginManager = LoginManager()
    
    loginManager.logIn([ .publicProfile, .userFriends, .email], viewController: self) {
      
      loginResult in
  
      
      switch loginResult {
        
        
      case .failed(let error):
        print(error)
        
        
      case .cancelled:
        print("User cancelled login.")
       
        
      case .success(let grantedPermissions, let declinedPermissions, let accessToken):
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
          // ...
          if let error = error {
            // ...
            return
          }
          
        }
        print("Logged in!")
      }
    }
    
  }
  
  
  //Code for sign out: How do we implement it?
  //let firebaseAuth = FIRAuth.auth()
  //do {
  //try firebaseAuth?.signOut()
  //} catch let signOutError as NSError {
  //print ("Error signing out: %@", signOutError)
  //}
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
