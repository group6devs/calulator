//
//  LogsCell.swift
//  Calulator
//
//  Created by Huy Le on 11/25/22.
//

import UIKit

class LogsCell: UITableViewCell {
    
    @IBOutlet weak var foodNameLog: UILabel!
    @IBOutlet weak var caloriesLog: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
