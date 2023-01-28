//
//  AddViewController.swift
//  D-DAY
//
//  Created by Hakyung Sohn on 2023/01/18.
//

import UIKit

class AddViewController: UIViewController {
    // Define the IBOutlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var addTableView: UITableView!
    
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var smallDday: UILabel!
    @IBOutlet weak var smallDayNumber: UILabel!
    @IBOutlet weak var smallTitle: UILabel!
    
    @IBOutlet weak var mediumView: UIView!
    
    @IBOutlet weak var largeView: UIView!
    
    // Textfield for Title
    var txtFieldForTitle: UITextField = UITextField()
    
    // Textfield for Subtitle
    var txtFieldForSubtitle: UITextField = UITextField()
    
    // Data for the Table settings
    let list = DdaySettingSection.generateData()
    
    // Variables for TextField
    var titleString: String?
    var subtitleString: String?
    
    // Variable for DatePicker
    var theDate: Date?
    
    // Variables for Colorwell
    var colorForTXT: UIColor?
    var colorForBackground: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

extension AddViewController {
    func configuration() {
        addTableView.sectionHeaderTopPadding = 50
        addTableView.isScrollEnabled = false
        
        saveButton.isEnabled = false
        
        addTableView.dataSource = self
        addTableView.delegate = self
        
        smallView.layer.cornerRadius = 20
        mediumView.layer.cornerRadius = 20
        largeView.layer.cornerRadius = 20
        
        fontConfigurationForDday()
        fontConfigurationForDate()
    }
    
    func fontConfigurationForDate() {
        self.smallDayNumber.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
    }
    
    func fontConfigurationForDday() {
        self.smallDday.transform = CGAffineTransform(rotationAngle: .pi * -0.1)
    }
    
    func fontConfigurationForTitle() {
        // font-size
        let smallTitleFontCount = smallTitle.text!.count
        if smallTitleFontCount <= 8 {
            smallTitle.font = smallTitle.font.withSize(19)
        } else if smallTitleFontCount > 8 {
            smallTitle.font = smallTitle.font.withSize(14)
        } else if smallTitleFontCount > 10 {
            smallTitle.font = smallTitle.font.withSize(12)
        }
    }
    
    func changeTitle(value title: String?) {
        self.smallTitle.text = title
        if self.titleString?.count == 0 {
            self.saveButton.isEnabled = false
        } else {
            self.saveButton.isEnabled = true
        }
        
        fontConfigurationForTitle()
    }
    
    // IBAction for '취소(cancel)' button
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // IBAction for '저장(save)' button
    @IBAction func saveButtonTapped(_ sender: Any) {
        // User Default for text
        UserDefaults.standard.set(self.titleString!, forKey: "titleString")
        UserDefaults.standard.set(self.subtitleString!, forKey: "subtitleString")
        
        // User Default for date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: self.theDate!)
        
        UserDefaults.standard.set(dateString, forKey: "theDate")
        
        // User Default for color
        UserDefaults.standard.set(self.colorForTXT, forKey: "colorForTXT")
        UserDefaults.standard.set(self.colorForBackground, forKey: "colorForBackground")
        
        self.dismiss(animated: true)
    }
}

extension AddViewController: DatePickerCellDelegate {
    func getDateValue(value date: Date) {
        self.theDate = date
        print("date: \(date)")
    }
}
    
extension AddViewController: ColorWellCellDelegate {
    // ColorWellCellDelegate method 구현
    func changeBGColor(bgColor color: UIColor?) {
        smallView.backgroundColor = color
        mediumView.backgroundColor = color
        largeView.backgroundColor = color
        
        colorForBackground = color
    }
    
    // ColorWellCellDelegate method 구현
    func changeTxtColor(txtColor color: UIColor?) {
        smallDday.textColor = color
        smallDayNumber.textColor = color
        smallTitle.textColor = color
        
        colorForTXT = color
    }
}

extension AddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row]
        
        if indexPath.section == 0 { // textfield section
            let cellForTxtfield = addTableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath) as! TextFieldCell
            
            if indexPath.row == 0 { // title row
                txtFieldForTitle = cellForTxtfield.accTextField
                cellForTxtfield.accTextField.addTarget(self, action: #selector(getTitle), for: .editingChanged)
            } else { // subtitle row
                txtFieldForSubtitle = cellForTxtfield.accTextField
                cellForTxtfield.accTextField.addTarget(self, action: #selector(getSubTitle), for: .editingDidEnd)
            }
            
            cellForTxtfield.textLabel?.text = "\(target.title)"
            
            return cellForTxtfield
            
        } else if indexPath.section == 1 { // datepicker section
            let cellForDatepicker = addTableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath) as! DatePickerCell
            cellForDatepicker.textLabel?.text = "\(target.title)"
            cellForDatepicker.delegate = self
            
            return cellForDatepicker
            
        } else { // colorwell section
            let cellForColorwell = addTableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath) as! ColorWellCell
            cellForColorwell.textLabel?.text = "\(target.title)"
            cellForColorwell.delegate = self
            
            return cellForColorwell
        }
    }
    
    @objc private func getTitle() {
        self.titleString = self.txtFieldForTitle.text
        
        // 제목이 바뀔때마다, 위젯 타이틀도 업데이트
        changeTitle(value: self.titleString!)
    }
    
    @objc private func getSubTitle() {
        self.subtitleString = self.txtFieldForSubtitle.text
        print("subtitle 2222: \(self.subtitleString!)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}

extension AddViewController: UITableViewDelegate {}
