//
//  DDAYCell.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/23.
//

import UIKit

class DDAYCell: UITableViewCell {

    @IBOutlet weak var titles: UIStackView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTitle.sizeToFit()
        subtitle.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
