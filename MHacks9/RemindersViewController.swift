//
//  RemindersViewController.swift
//  MHacks9
//
//  Created by Kenan Dominic on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var events: [NSDictionary]?
    
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
        
        cell.titleLabel.text = event?["event"] as? String
        cell.dateLabel.text = event?["date"] as? String
        
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
