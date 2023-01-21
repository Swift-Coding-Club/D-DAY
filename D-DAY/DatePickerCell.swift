//
//  DatePickerCell.swift
//  D-DAY
//
//  Created by Hakyung Sohn on 2023/01/20.
//

import UIKit

class DatePickerCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let accDatePicker: UIDatePicker = UIDatePicker()
        accDatePicker.datePickerMode = .date
        accDatePicker.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        accDatePicker.contentHorizontalAlignment = .trailing
        accDatePicker.contentVerticalAlignment = .center
        
        accessoryView = accDatePicker
    }
}
