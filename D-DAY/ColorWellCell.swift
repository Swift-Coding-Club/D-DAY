//
//  ColorWellCell.swift
//  D-DAY

//
//  Created by Hakyung Sohn on 2023/01/21.
//

import UIKit

// 시키는데서, protocol 만들고, delegate?.chagneColor()로 시키기
protocol ColorWellCellDelegate: AnyObject {
    func changeBGColor(bgColor color: UIColor?)
    func changeTxtColor(txtColor color: UIColor?)
}

class ColorWellCell: UITableViewCell {
    // ColorWellCellDelegate object
    weak var delegate: ColorWellCellDelegate?
    
    @IBOutlet weak var colorwellText: UIColorWell!
    @IBOutlet weak var colorwellBackground: UIColorWell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configuration()
    }
}

extension ColorWellCell {
    func configuration() {
        colorwellText.selectedColor = UIColor(named: "ddayBlack")
        colorwellBackground.selectedColor = UIColor(named: "ddayNeonGreen")
        
        colorwellText.addTarget(self, action: #selector(txtColorChange), for: .valueChanged)
        colorwellBackground.addTarget(self, action: #selector(backgroundColorChange), for: .valueChanged)
    }
    
    // Action function when 'colorwellBackground' tapped
    @objc private func backgroundColorChange() {
        let changedColorForBackground = colorwellBackground.selectedColor
        delegate?.changeBGColor(bgColor: changedColorForBackground)
        
    }
    
    // Action function when 'colorwellText' tapped
    @objc private func txtColorChange() {
        let changedColorForTXT = colorwellText.selectedColor
        delegate?.changeTxtColor(txtColor: changedColorForTXT)
    }
}
