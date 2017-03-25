//
//  Facebook.swift
//  MHacks9
//
//  Created by Deetpanshu Malik on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Firebase

class Facebook: NSObject {
  static let sharedInstance = Facebook()
  
  func Login(success: @escaping() -> (), failure: @escaping (Error) -> ())
  {
    
    //You typically should check if AccessToken.current already contains the permissions you need before asking to reduce unnecessary app switching
    //print("User must sign in")
    let loginManager = LoginManager()
    
    loginManager.logIn([ .publicProfile, .userFriends, .email]) {
      
      loginResult in
      
      
      switch loginResult {
      case .failed(let error):
        print(error)
      case .cancelled:
        print("User cancelled login.")
      case .success(let grantedPermissions, let declinedPermissions, let accessToken):
        //self.performSegue(withIdentifier: "tabBarSegue", sender: nil)
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
          // ...
          if let error = error {
            // ...
            failure(error)
          } else {
            success()
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
    
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue:"userDidLogout"), object: nil)
    
    print("signed out")
    printFirebaseUsers()
    
  }
  
  //MARK: Private
  
  //for debugging
  private func printFirebaseUsers(){
    if let user = FIRAuth.auth()?.currentUser {
      print("User signed in")
    } else {
      print("User not signed in")
    }
  }
}
//MARK: Login and Logout

