//
//  DatePickerCell.swift
//  D-DAY
//
//  Created by Hakyung Sohn on 2023/01/20.
//

import UIKit

protocol DatePickerCellDelegate: AnyObject {
    func getDateValue(value date: Date)
}

class DatePickerCell: UITableViewCell {
    
    let accDatePicker: UIDatePicker = UIDatePicker()
    
    weak var delegate: DatePickerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        accDatePicker.datePickerMode = .date
        accDatePicker.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        accDatePicker.contentHorizontalAlignment = .trailing
        accDatePicker.contentVerticalAlignment = .center
        
        accessoryView = accDatePicker
        
        accDatePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    @objc private func dateChanged() {
        delegate?.getDateValue(value: accDatePicker.date)
    }
}
