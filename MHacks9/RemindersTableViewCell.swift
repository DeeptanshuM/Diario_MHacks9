//
//  RemindersTableViewCell.swift
//  MHacks9
//
//  Created by Kenan Dominic on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit

class RemindersTableViewCell: UITableViewCell {
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scheduleView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tagView.layer.cornerRadius = tagView.frame.width / 2
        tagView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
