//
//  TaskCell.swift
//  TaskIt
//
//  Created by Rian Rainey on 2/15/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
  @IBOutlet weak var taskLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
