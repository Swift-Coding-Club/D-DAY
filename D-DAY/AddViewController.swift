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
    @IBOutlet weak var smallPlus: UILabel!
    @IBOutlet weak var smallDayNumber: UILabel!
    @IBOutlet weak var smallTitle: UILabel!
    
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var mediumDday: UILabel!
    @IBOutlet weak var mediumDayNumber: UILabel!
    
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
        
        smallView.clipsToBounds = true
        mediumView.clipsToBounds = true
        largeView.clipsToBounds = true
        
        fontConfigurationForDday()
        fontConfigurationForDate()
    }
    
    func calculateDday() -> Int {
        // D-day 날짜 계산
        // date-picker 선택시간 (formattedTargetDate)
        let targetDateString = dateFormatToString(from: self.theDate!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let formattedTargetDate = dateFormatter.date(from: targetDateString)!
        
        // 현재시간 (formattedCurrentDate)
        let currentDateString = dateFormatToString(from: Date())
        let formattedCurrentDate = dateFormatter.date(from: currentDateString)!
        
        let timeInterval = Calendar.current.dateComponents([.day], from: formattedTargetDate, to: formattedCurrentDate)
        
        return timeInterval.day!
    }
    
    func fontConfigurationForDday() {
        // 폰트
        self.smallDday.font = UIFont(name: "Inter-Bold", size: 93.0) // 93
        // 회전
        self.smallDday.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        // 자간
        self.smallDday.addCharacterSpacing(-0.2)
        
        
        self.mediumDday.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
        self.mediumDday.addCharacterSpacing(-0.1)
        self.mediumDday.font = UIFont(name: "Inter-Bold", size: 96.0)
        self.mediumDayNumber.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
        self.mediumDayNumber.addCharacterSpacing(-0.1)
        self.mediumDayNumber.font = UIFont(name: "Inter-Bold", size: 102.0)
        
    }
    
    func fontConfigurationForDate() {
        // 회전
        self.smallDayNumber.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
        self.smallPlus.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        // font-size
        if Int(smallDayNumber.text!)! <= 0 {
            smallDayNumber.text = String((-1) * Int(smallDayNumber.text!)!)
            smallPlus.text = ""
        }
        else {
            smallPlus.text = "+"
            smallPlus.font = UIFont(name: "Inter-Bold", size: 30.0)
        }
        
        let smallDayNumberFontCount = smallDayNumber.text!.count
        if smallDayNumberFontCount <= 2 {
            self.smallDayNumber.font = UIFont(name: "Inter-Bold", size: 117.0)
            
            if smallDayNumberFontCount == 1 {
                self.smallDayNumber.text = "0" + self.smallDayNumber.text!
            }
        } else {
            self.smallDayNumber.font = UIFont(name: "Inter-Bold", size: 109.0)
        }
        
        // 숫자별 폰트사이즈 조절
        let intNumber = Int(smallDayNumber!.text!)!
        switch intNumber / 100 {
        case 1:
            smallDayNumber.font = smallDayNumber.font.withSize(106)
        case 3...9:
            smallDayNumber.font = smallDayNumber.font.withSize(101)
        default:
            break
        }
        
        if intNumber % 100 == 0 {
            smallDayNumber.font = smallDayNumber.font.withSize(92)
        }
        
        switch smallDayNumber.text {
        case "00":
            smallDayNumber.font = smallDayNumber.font.withSize(117)
        case "111":
            smallDayNumber.font = smallDayNumber.font.withSize(123)
        case "222":
            smallDayNumber.font = smallDayNumber.font.withSize(105)
        case "100":
            smallDayNumber.font = smallDayNumber.font.withSize(100)
        default:
            break
        }
        
        // 자간 조절
        self.smallDayNumber.addCharacterSpacing()
    }
    
    func fontConfigurationForTitle() {
        // font-size
        let smallTitleFontCount = smallTitle.text!.count
        if smallTitleFontCount <= 8 {
            smallTitle.font = smallTitle.font.withSize(17)
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
    
    func dateFormatToString(from value: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        return dateFormatter.string(from: value)
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
        let dateString = dateFormatToString(from: self.theDate!)
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
        self.smallDayNumber.text = String(calculateDday())
        fontConfigurationForDate()
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
    
    // ColorWellCellDelegate method 구현
    func changeBothColor(bg bgColor: UIColor?, txt txtColor: UIColor?) {
        smallDday.textColor = txtColor
        smallPlus.textColor = txtColor
        smallDayNumber.textColor = txtColor
        smallTitle.textColor = txtColor
        mediumDday.textColor = txtColor
        mediumDayNumber.textColor = txtColor
        colorForTXT = txtColor
        
        smallView.backgroundColor = bgColor
        mediumView.backgroundColor = bgColor
        largeView.backgroundColor = bgColor
        colorForBackground = bgColor
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

extension UILabel {
    func addCharacterSpacing(_ value: Double = -0.1) {
        let kernValue = self.font.pointSize * CGFloat(value)
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
}
