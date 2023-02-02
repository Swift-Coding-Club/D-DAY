//
//  ColorWellCell.swift
//  D-DAY

//
//  Created by Hakyung Sohn on 2023/01/21.
//

import UIKit

protocol ColorWellCellDelegate: AnyObject {
    func changeBGColor(bgColor color: UIColor?)
    func changeTxtColor(txtColor color: UIColor?)
    func changeBothColor(bg bgColor: UIColor?, txt txtColor: UIColor?)
}

class ColorWellCell: UITableViewCell {
    // ColorWellCellDelegate object
    weak var delegate: ColorWellCellDelegate?
    
    @IBOutlet weak var colorwellText: UIColorWell!
    @IBOutlet weak var colorwellBackground: UIColorWell!
    @IBOutlet weak var anyColorButton: UIButton!
    
    var colorIndex = 0
    
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
        anyColorButton.addTarget(self, action: #selector(showAnyColor), for: .touchUpInside)
        
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
    
    // Action function when 'any-color button' tapped
    @objc private func showAnyColor() {
        let colorList = Color.colorList
        
        colorIndex += 1
        if colorIndex >= colorList.count {
            colorIndex = 0
        }
        let changedColorForBackground = colorList[colorIndex].bgColor
        let changedColorForTXT = colorList[colorIndex].txtColor
        
        colorwellBackground.selectedColor = colorList[colorIndex].bgColor
        colorwellText.selectedColor = colorList[colorIndex].txtColor
    
        delegate?.changeBothColor(bg: changedColorForBackground, txt: changedColorForTXT)
    }
}
