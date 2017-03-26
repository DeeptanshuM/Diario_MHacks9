//
//  RemindersViewController.swift
//  MHacks9
//
//  Created by Kenan Dominic on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit
import Firebase

class RemindersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var events: [NSDictionary]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        let userID = FIRAuth.auth()?.currentUser?.uid
        ref.child("users").child(userID!).child("Events").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [NSDictionary]
            if let value = value {
                self.events = []
                for val in value {
                    let name = val["title"] as? String ?? "Your Event"
                    let date = val["date"] as? String ?? ""
                    let time = val["time"] as? String ?? ""
                    let song = val["song"] as? String ?? ""
                    let tag = val["tag"] as? Int
                    let priority = val["priority"] as? Int
                    let dict = ["name" : name, "date" : date, "time" : time, "song" : song, "tag" : tag, "priority" : priority] as NSDictionary
                    self.events?.append(dict)
                }
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let transparentPixel = UIImage(named: "clear")
        self.tabBarController?.tabBar.backgroundImage = transparentPixel
        self.tabBarController?.tabBar.shadowImage = transparentPixel
        self.tabBarController?.tabBar.isTranslucent = true
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminders", for: indexPath) as! RemindersTableViewCell
        
        let event = events?[indexPath.row]
        
        cell.titleLabel.text = event?["name"] as? String
        cell.dateLabel.text = event?["date"] as? String
        let color = event?["tag"] as! Int
        
        if color == 0 {
            cell.tagView.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        }
        else if color == 1 {
            cell.tagView.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        else if color == 2 {
            cell.tagView.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        }
        else if color == 3 {
            cell.tagView.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
        else if color == 4 {
            cell.tagView.backgroundColor = #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
        }
        else if color == 5 {
            cell.tagView.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        }
        
        if event?["priority"] as! Int == 0 {
            cell.scheduleView.image = #imageLiteral(resourceName: "iconmonstr-check-mark-5-240")
            cell.scheduleView.tintColor = .green
        }
        else if event?["priority"] as! Int == 1 {
            cell.scheduleView.image = #imageLiteral(resourceName: "iconmonstr-help-3-240")
            cell.scheduleView.tintColor = .blue
        }
        
        return cell
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
