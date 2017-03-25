//
//  LogInViewController.swift
//  MHacks9
//
//  Created by Deetpanshu Malik on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//
import UIKit
import FacebookCore
import FacebookLogin
import Firebase

class LogInViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let accessToken = AccessToken.current {
      //what segues do we want here???
      
        performSegue(withIdentifier: "tabBarSegue", sender: Any?.self)
    }
  }
  
  //MARK: Properties
  
  @IBOutlet weak var signInButton: UIButton!
  
  //MARK: Actions
  @IBAction func signInClicked(_ sender: UIButton) {
    //print("Clicked")
  
    //You typically should check if AccessToken.current already contains the permissions you need before asking to reduce unnecessary app switching
    //print("User must sign in")
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
          print("Logged in!")
          self.printFirebaseUsers()
        }
      }
    }
    
  }
  
  public func logOut(){
    let firebaseAuth = FIRAuth.auth()
    
    do {
      try FIRAuth.auth()?.signOut()
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
    
    try! FIRAuth.auth()!.signOut()
    let loginManager = LoginManager()
    loginManager.logOut() // this is an instance function
    
    print("signed out")
    printFirebaseUsers()
    
  }
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: Private
  
  //for debugging
  func printFirebaseUsers(){
    if let user = FIRAuth.auth()?.currentUser {
      print("User signed in")
    } else {
      print("User not signed in")
    }
  }
}
