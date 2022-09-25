//
//  ToDoCell.swift
//  Odev 3
//
//  Created by Joshua Sands on 25.09.2022.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var isCompleteImage: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
