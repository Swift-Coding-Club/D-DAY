//
//  ModalAddTableViewCell.swift
//  D-DAY
//
//  Created by Hakyung Sohn on 2023/01/20.
//

import UIKit

class TextFieldCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let accTextField: UITextField = UITextField()
        accTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        accTextField.placeholder = "입력하기"
        accTextField.textAlignment = .right
        accTextField.clearButtonMode = .whileEditing
        accessoryView = accTextField
        
        accTextField.delegate = self
    }
}

extension TextFieldCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Event of back-space
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        
        // Text length control
        guard (textField.text?.count)! < 10 else {
            // 10글자 미만으로 입력해주세요 event
            return false
        }
        return true
    }
    
    // Keyboard goes down when 'return' button tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

