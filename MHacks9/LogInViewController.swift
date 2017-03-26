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
import MBProgressHUD

class LogInViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let accessToken = AccessToken.current {
      //what segues do we want here???
      
        //performSegue(withIdentifier: "tabBarSegue", sender: Any?.self)
    }
  }
  
  //MARK: Properties
  
  //@IBOutlet weak var signInButton: UIButton!
  
  //MARK: Actions
  @IBAction func signInClicked(_ sender: UIButton) {
    print("Clicked")
    MBProgressHUD.showAdded(to: self.view, animated: true)
    //You typically should check if AccessToken.current already contains the permissions you need before asking to reduce unnecessary app switching
    //print("User must sign in")
    Facebook.sharedInstance.Login(success: {
        
      self.performSegue(withIdentifier: "tabBarSegue", sender: nil)
        MBProgressHUD.hide(for: self.view, animated: true)
    }, failure: { (error) in
        print(error.localizedDescription)
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  /*
  //MARK: Private
  */
  //for debugging
  func printFirebaseUsers(){
    if let user = FIRAuth.auth()?.currentUser {
      print("User signed in")
    } else {
      print("User not signed in")
    }
  }
}
