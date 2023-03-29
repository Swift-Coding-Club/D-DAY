//
//  DDAYCell.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/23.
//

import UIKit

class DDAYCell: UITableViewCell {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var dday: UILabel!

    @IBOutlet weak var editingAccessoryButton: UIButton!
    
    var callBackMehtod: (() -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTitle.sizeToFit()
        subtitle.sizeToFit()
        
        let newSize = date.sizeThatFits( CGSize(width: date.frame.width, height: CGFloat.greatestFiniteMagnitude))
        date.frame.size.width = newSize.width
        date.frame.size.height = newSize.height

    }
    @IBAction func editButtonTapped(_ sender: Any) {
        callBackMehtod?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
