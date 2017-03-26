//
//  ProfileViewController.swift
//  MHacks9
//
//  Created by Kenan Dominic on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let transparentPixel = UIImage(named: "clear")
        self.tabBarController?.tabBar.backgroundImage = transparentPixel
        self.tabBarController?.tabBar.shadowImage = transparentPixel
        self.tabBarController?.tabBar.isTranslucent = true
        
        phoneField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func onLogout(_ sender: Any) {
        Facebook.sharedInstance.logOut()
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
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
