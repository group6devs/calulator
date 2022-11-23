//
//  FoodCellTableViewCell.swift
//  Calulator
//
//  Created by Dunyagozel Durdyyeva on 11/21/22.
//

import UIKit

class FoodCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var addFoodButton: UIButton!
    @IBOutlet weak var calories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
