//
//  CreateViewController.swift
//  MHacks9
//
//  Created by Ryuji Mano on 3/26/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    @IBOutlet weak var hourField: UITextField!
    @IBOutlet weak var minuteField: UITextField!
    
    @IBOutlet weak var songField: UITextField!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var priorityView: UIImageView!
    
    @IBOutlet var tapGesture1: UITapGestureRecognizer!
    @IBOutlet var tapGesture2: UITapGestureRecognizer!
    @IBOutlet var tapGesture3: UITapGestureRecognizer!
    @IBOutlet var tapGesture4: UITapGestureRecognizer!
    @IBOutlet var tapGesture5: UITapGestureRecognizer!
    @IBOutlet var tapGesture6: UITapGestureRecognizer!
    
    @IBOutlet var priorityTapGesture: UITapGestureRecognizer!
    
    var color = "blue"
    var priority = 0
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view1.layer.cornerRadius = view1.frame.width / 2
        view2.layer.cornerRadius = view2.frame.width / 2
        view3.layer.cornerRadius = view3.frame.width / 2
        view4.layer.cornerRadius = view4.frame.width / 2
        view5.layer.cornerRadius = view5.frame.width / 2
        view6.layer.cornerRadius = view6.frame.width / 2
        
        priorityView.tintColor = .green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        sender.view?.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
    }

    @IBAction func priorityTap(_ sender: UITapGestureRecognizer) {
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
