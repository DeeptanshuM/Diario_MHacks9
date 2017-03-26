//
//  CreateViewController.swift
//  MHacks9
//
//  Created by Ryuji Mano on 3/26/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

class CreateViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate{
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
    
    var color = 0
    var priority = 0
    var date: Date?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view1.layer.cornerRadius = view1.frame.width / 2
        view2.layer.cornerRadius = view2.frame.width / 2
        view3.layer.cornerRadius = view3.frame.width / 2
        view4.layer.cornerRadius = view4.frame.width / 2
        view5.layer.cornerRadius = view5.frame.width / 2
        view6.layer.cornerRadius = view6.frame.width / 2
        
        priorityView.tintColor = .green
        
        view1.layer.borderColor = UIColor.black.cgColor
        view1.layer.borderWidth = 5
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: contentView.frame.origin.y + contentView.frame.height)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
//        view.insertSubview(scrollView, at: 0)
        
        print(date!)
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-yyyy-MM HH:mm:ss"
        
        let dateString = dateFormatter.string(from: self.date!)

        let arr2 = dateString.components(separatedBy: " ")
        let arr3 = arr2[1].components(separatedBy: ":")
        let arr = arr2[0].components(separatedBy: "-")
        
        monthField.text = arr[2]
        dayField.text = arr[0]
        yearField.text = arr[1]
        
        print(dateString)
        print(arr2)
        print(arr3)
        
        hourField.text = arr3[0]
        minuteField.text = arr3[1]
        
        nameField.delegate = self
        
        monthField.delegate = self
        dayField.delegate = self
        yearField.delegate = self
        
        hourField.delegate = self
        minuteField.delegate = self
        songField.delegate = self
        
        tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        
        view1.isUserInteractionEnabled = true
        view2.isUserInteractionEnabled = true
        view3.isUserInteractionEnabled = true
        view4.isUserInteractionEnabled = true
        view5.isUserInteractionEnabled = true
        view6.isUserInteractionEnabled = true
        
        view1.addGestureRecognizer(tapGesture1)
        view2.addGestureRecognizer(tapGesture2)
        view3.addGestureRecognizer(tapGesture3)
        view4.addGestureRecognizer(tapGesture4)
        view5.addGestureRecognizer(tapGesture5)
        view6.addGestureRecognizer(tapGesture6)
        
        priorityTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.priorityTap(_:)))
        priorityView.isUserInteractionEnabled = true
        priorityView.addGestureRecognizer(priorityTapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.1) {
            
            if self.view1.layer.borderWidth != 0 {
                self.view1.layer.borderWidth = 0
            }
            else if self.view2.layer.borderWidth != 0 {
                self.view2.layer.borderWidth = 0
            }
            else if self.view3.layer.borderWidth != 0 {
                self.view3.layer.borderWidth = 0
            }
            else if self.view4.layer.borderWidth != 0 {
                self.view4.layer.borderWidth = 0
            }
            else if self.view5.layer.borderWidth != 0 {
                self.view5.layer.borderWidth = 0
            }
            else if self.view6.layer.borderWidth != 0 {
                self.view6.layer.borderWidth = 0
            }
            
            sender.view?.layer.borderColor = UIColor.black.cgColor
            sender.view?.layer.borderWidth = 5
            
        }
        if view1 == sender.view {
            color = 0
        }
        else if view2 == sender.view {
            color = 1
        }
        else if view3 == sender.view {
            color = 2
        }
        else if view4 == sender.view {
            color = 3
        }
        else if view5 == sender.view {
            color = 4
        }
        else if view6 == sender.view {
            color = 5
        }
    }

    @IBAction func priorityTap(_ sender: UITapGestureRecognizer) {
        if priority != 1 {
            priority = 1
            priorityView.image = #imageLiteral(resourceName: "iconmonstr-help-3-240")
            priorityView.tintColor = .blue
            priorityLabel.text = "Unsure.."
        }
        else {
            priority = 0
            priorityView.image = #imageLiteral(resourceName: "iconmonstr-check-mark-5-240")
            priorityView.tintColor = .green
            priorityLabel.text = "Going!"
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    @IBAction func onSubmit(_ sender: Any) {
        
        let title = nameField!.text
        let date = ("\(monthField!.text!)-\(dayField!.text!)-\(yearField!.text!)")
        let time = ("\(hourField!.text!):\(minuteField!.text!)")
        let song = songField!.text
        let tag = color
        let priority = self.priority
        
        var ref: FIRDatabaseReference!
        var user = FIRAuth.auth()?.currentUser
        ref = FIRDatabase.database().reference()
            
        let dict = ["name": title, "date": date, "time": time, "song": song, "tag": tag, "priority": priority] as [String : Any]
        
        ref.child("users").child(user!.uid).child("Events").childByAutoId().setValue(dict)
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        
        nameField.resignFirstResponder()
        monthField.resignFirstResponder()
        dayField.resignFirstResponder()
        yearField.resignFirstResponder()
        hourField.resignFirstResponder()
        minuteField.resignFirstResponder()
        songField.resignFirstResponder()
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        let date2 = "\(monthField!.text!)-\(dayField!.text!)-\(yearField!.text!) \(Int(hourField!.text!)! - 1):\(minuteField!.text!):00"
        let date3 = dateFormatter.date(from: date2)
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.scheduleNotification(at: date3!, title: title!)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        var userInfo = notification.userInfo
        var keyboardFrame = (userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        self.scrollView.contentInset = contentInset
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if textField != nameField && textField != yearField && textField != songField{
        let currentCharacterCount = textField.text?.characters.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.characters.count - range.length
        return newLength <= 2
            
        }
        if textField == yearField{
            let currentCharacterCount = textField.text?.characters.count ?? 0
            if (range.length + range.location > currentCharacterCount){
                return false
            }
            let newLength = currentCharacterCount + string.characters.count - range.length
            return newLength <= 4
        }
        
        return false
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
