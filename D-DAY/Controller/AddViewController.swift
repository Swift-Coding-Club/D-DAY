//
//  AddViewController.swift
//  D-DAY
//
//  Created by Hakyung Sohn on 2023/01/18.
//

import UIKit

class AddViewController: UIViewController {
    // Define the IBOutlets
    
    // navigation bar
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    // D-Day info
    @IBOutlet weak var addTableView: UITableView!
    
    // widget - small
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var smallDday: UILabel!
    @IBOutlet weak var smallPlus: UILabel!
    @IBOutlet weak var smallDayNumber: UILabel!
    @IBOutlet weak var smallTitle: UILabel!
    
    // widget - medium
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var mediumDday: UILabel!
    @IBOutlet weak var mediumTitle: UILabel!
    @IBOutlet weak var mediumDate: UILabel!

    // widget - medium 2
    @IBOutlet weak var mediumView2: UIView!
    @IBOutlet weak var mediumDday2: UILabel!
    @IBOutlet weak var mediumDayNumber2: UILabel!
    @IBOutlet weak var mediumTitle2: UILabel!
    @IBOutlet weak var mediumDate2: UILabel!
    
    @IBOutlet weak var languageButton: UIButton!
    
    // wiget - large
    @IBOutlet weak var largeView: UIView!
    @IBOutlet weak var largeDday: UILabel!
    @IBOutlet weak var largeTitle: UILabel!
    @IBOutlet weak var largeDate: UILabel!
    @IBOutlet weak var largeDayNumber: UILabel!
    
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
    var theDate: Date = Date()
    
    // Variables for Colorwell
    var colorForTXT: UIColor?
    var colorForBackground: UIColor?
    
    // UserDefaults 넣어 줄 struct list
    var ddayList = [DdayInfo]()
    
    // Language
    var language: String = "English"

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupPopUpLanguageButton()
    }
    
//    // DetailViewController.swift
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        NotificationCenter.default.post(name: NSNotification.Name("DismissDetailView"), object: nil, userInfo: nil)
//    }
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
        mediumView2.layer.cornerRadius = 20
        largeView.layer.cornerRadius = 20
        
        smallView.clipsToBounds = true
        mediumView.clipsToBounds = true
        mediumView2.clipsToBounds = true
        largeView.clipsToBounds = true
        
        fontConfigurationForDday()
        fontConfigurationForDateOfSmall()
    }
    
    func setupPopUpLanguageButton() {
        let popUpButtonClosure = { [self] (action: UIAction) in
            language = action.title
            languageButtonConfiguration(lan: language)
        }
                
        languageButton.menu = UIMenu(title: "Language",
            children: [
            UIAction(title: "English", handler: popUpButtonClosure),
            UIAction(title: "Korean", handler: popUpButtonClosure),
            UIAction(title: "Japanese", handler: popUpButtonClosure),
            UIAction(title: "Spanish", handler: popUpButtonClosure),
        ])
        languageButton.layer.cornerRadius = 10
    }
    
    func languageButtonConfiguration(lan: String) {
        switch lan {
        case "English":
            if Int(mediumDayNumber2.text!)! <= 0 {
                mediumDayNumber2.text = String((-1) * Int(mediumDayNumber2.text!)!)
                mediumDday2.text = "Dday"
                mediumDday2.addCharacterSpacing(-0.03)
            } else {
                mediumDday2.text = "Day+"
                mediumDday2.addCharacterSpacing()
            }
            
            mediumDday2.font = mediumDday2.font.withSize(61)
            self.mediumDday2.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
            
            NSLayoutConstraint.activate([
                mediumDday2.bottomAnchor.constraint(
                    equalTo: self.mediumView2.bottomAnchor, constant: -64)
            ])
            
        case "Korean":
            if Int(mediumDayNumber2.text!)! <= 0 {
                mediumDayNumber2.text = String((-1) * Int(mediumDayNumber2.text!)!)
                mediumDday2.font = mediumDday2.font.withSize(55)
                mediumDday2.text = "디데이"
            } else {
                mediumDday2.text = "데이+"
                mediumDday2.font = mediumDday2.font.withSize(60)
            }
            
            self.mediumDday2.transform = CGAffineTransform(rotationAngle: .pi * -0.05)
            
            mediumDday2.addCharacterSpacing()
            NSLayoutConstraint.activate([
                mediumDday2.bottomAnchor.constraint(
                    equalTo: self.mediumView2.bottomAnchor, constant: -42)
            ])
            
        case "Japanese":
            
            if Int(mediumDayNumber2.text!)! <= 0 {
                mediumDayNumber2.text = String((-1) * Int(mediumDayNumber2.text!)!)
                mediumDday2.text = "ディ-デ-"
                mediumDday2.font = mediumDday2.font.withSize(50)
                NSLayoutConstraint.activate([
                    mediumDday2.bottomAnchor.constraint(
                        equalTo: self.mediumView2.bottomAnchor, constant: -30)
                ])
            } else {
                mediumDday2.text = "デイ+"
                mediumDday2.font = mediumDday2.font.withSize(65)
                NSLayoutConstraint.activate([
                    mediumDday2.bottomAnchor.constraint(
                        equalTo: self.mediumView2.bottomAnchor, constant: -60)
                ])
            }
            
            mediumDday2.addCharacterSpacing(-0.1)
            self.mediumDday2.transform = CGAffineTransform(rotationAngle: .pi * -0.05)
            
        default:
            break
        }
        self.mediumDayNumber2.addCharacterSpacing(-0.1)
    }
    
    func calculateDday() -> Int {
        // D-day 날짜 계산
        // date-picker 선택시간 (formattedTargetDate)
//        let targetDateString = dateFormatToString(from: self.theDate!)
        let targetDateString = dateFormatToString(from: self.theDate)
        
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
        self.smallDday.font = UIFont(name: "Inter-Bold", size: 95.0)
        self.largeDday.font = UIFont(name: "Inter-Bold", size: 165.0) // "D"
        // 회전
        self.smallDday.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        self.mediumDday.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
        self.mediumDday2.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        self.largeDday.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        // 자간
        self.mediumDday.addCharacterSpacing(-0.1)
        self.mediumDday2.addCharacterSpacing(-0.03)
        
        self.mediumDday.font = UIFont(name: "Inter-Bold", size: 101.0)
        self.mediumTitle.font = UIFont(name: "Inter-Bold", size: 14.0)
        self.mediumDate.font =  UIFont(name: "Inter-Medium", size: 10.0)
        
        self.largeDayNumber.transform = CGAffineTransform(rotationAngle: .pi * -0.05)
        self.largeDayNumber.addCharacterSpacing(-0.1)
        self.largeDayNumber.font = UIFont(name: "Inter-Bold", size: 178.0)
        // 165 - 999
        // 178 - 124
        // 160 - 300
        
        
        self.mediumDayNumber2.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
        self.mediumDayNumber2.addCharacterSpacing(-0.1)
        self.mediumDayNumber2.font = UIFont(name: "Inter-Bold", size: 106.0)
        self.mediumTitle2.font = UIFont(name: "Inter-Bold", size: 25.0) // 많이-14, 4-25
        self.mediumDate2.font = UIFont(name: "Inter-Medium", size: 10.0)
    }
    
    func fontConfigurationForLarge() {
        // font-size
        if Int(self.largeDayNumber.text!)! <= 0 {
            self.largeDayNumber.text = String((-1) * Int(self.largeDayNumber.text!)!)
            self.largeDday.text = "D"
            self.largeDday.font = UIFont(name: "Inter-Bold", size: 165.0)
            print("constraint >>>> \(largeDday.constraints)")
            print("font >>>> \(largeDday.font)")
        }
        else {
            self.largeDday.text = "+"
            self.largeDday.font = UIFont(name: "Inter-Bold", size: 200.0)
        }
        
        let largeDayNumberCount = self.largeDayNumber.text!.count
        if largeDayNumberCount == 1 {
            self.largeDayNumber.text = "0" + self.largeDayNumber.text!
        }
        
        self.largeDayNumber.addCharacterSpacing()
    }
    
    func fontConfigurationForMedium1() {
        // font-size
        let mediumTitle1FontCount = mediumTitle.text!.count
        if mediumTitle1FontCount <= 2 {
            self.mediumTitle.font = UIFont(name: "Inter-Bold", size: 22.0)
        } else if mediumTitle1FontCount <= 7 && mediumTitle1FontCount > 2 {
            self.mediumTitle.font = UIFont(name: "Inter-Bold", size: 18.0)
        } else {
            self.mediumTitle.font = UIFont(name: "Inter-Bold", size: 14.0)
        }
    }
    
    func fontConfigurationForMedium2() {
        // medium2 설정 (+/-와, language에 따른 설정 변경)
        languageButtonConfiguration(lan: language)
        
        let mediumDayNumberCount = mediumDayNumber2.text!.count
        switch mediumDayNumberCount {
        case 1:
            mediumDayNumber2.text = "00" + mediumDayNumber2.text!
        case 2:
            mediumDayNumber2.text = "0" + mediumDayNumber2.text!
        default:
            break
        }
        
        if String(mediumDayNumber2.text!) == "000" {
            self.mediumDayNumber2.font = UIFont(name: "Inter-Bold", size: 100.0)
        } else {
            self.mediumDayNumber2.font = UIFont(name: "Inter-Bold", size: 105.0)
        }
        
        let mediumTitle2FontCount = mediumTitle2.text!.count
        if mediumTitle2FontCount <= 2 {
            self.mediumTitle2.font = UIFont(name: "Inter-Bold", size: 30.0)
        } else if mediumTitle2FontCount <= 4 && mediumTitle2FontCount > 2 {
            self.mediumTitle2.font = UIFont(name: "Inter-Bold", size: 25.0)
        } else if mediumTitle2FontCount <= 9 && mediumTitle2FontCount > 4 {
            self.mediumTitle2.font = UIFont(name: "Inter-Bold", size: 19.0)
        } else if mediumTitle2FontCount <= 12 && mediumTitle2FontCount > 9 {
            self.mediumTitle2.font = UIFont(name: "Inter-Bold", size: 15.0)
        } else {
            self.mediumTitle2.font = UIFont(name: "Inter-Bold", size: 13.0)
        }
        
        self.mediumDayNumber2.addCharacterSpacing()
    }
    
    func fontConfigurationForDateOfSmall() {
        // 회전
        self.smallDayNumber.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
        self.smallPlus.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        // font-size
        if Int(smallDayNumber.text!)! <= 0 {
            smallDayNumber.text = String((-1) * Int(smallDayNumber.text!)!)
            smallPlus.text = ""
            self.smallDday.font = UIFont(name: "Inter-Bold", size: 95.0)
        }
        else {
            smallPlus.text = "+"
            self.smallDday.font = UIFont(name: "Inter-Bold", size: 79.0)
            self.smallPlus.font = UIFont(name: "Inter-Bold", size: 60.0)
            smallDday.addCharacterSpacing(-0.3)
        }
        
        let smallDayNumberFontCount = smallDayNumber.text!.count
        if smallDayNumberFontCount <= 2 {
            self.smallDayNumber.font = UIFont(name: "Inter-Bold", size: 115.0)
            
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
            smallDayNumber.font = smallDayNumber.font.withSize(104)
        case 2:
            smallDayNumber.font = smallDayNumber.font.withSize(100)
        case 3...9:
            smallDayNumber.font = smallDayNumber.font.withSize(96)
        default:
            break
        }
        
        if intNumber % 100 == 0 {
            smallDayNumber.font = smallDayNumber.font.withSize(92)
        }
        
        switch smallDayNumber.text {
        case "00":
            smallDayNumber.font = smallDayNumber.font.withSize(110)
        case "111":
            smallDayNumber.font = smallDayNumber.font.withSize(123)
        case "204":
            smallDayNumber.font = smallDayNumber.font.withSize(94)
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
    
    func fontConfigurationForTitleForSmall() {
        // font-size
        let smallTitleFontCount = smallTitle.text!.count
        if smallTitleFontCount <= 3 {
            smallTitle.font = smallTitle.font.withSize(18)
        } else if smallTitleFontCount > 3 && smallTitleFontCount <= 8 {
            smallTitle.font = smallTitle.font.withSize(16)
        } else if smallTitleFontCount > 8 {
            smallTitle.font = smallTitle.font.withSize(14)
        }
    }
    
    func changeTitle(value title: String?) {
        self.smallTitle.text = title
        self.mediumTitle.text = title
        self.mediumTitle2.text = title
        if self.titleString?.count == 0 {
            self.saveButton.isEnabled = false
        } else {
            self.saveButton.isEnabled = true
        }
        
        fontConfigurationForTitleForSmall()
        fontConfigurationForMedium1()
        fontConfigurationForMedium2()
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
    
    func save(_ existingDdayInfoList: [DdayInfo]) {
        let data = existingDdayInfoList.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "DdayInfoList")
    }
    
    // IBAction for '저장(save)' button
    @IBAction func saveButtonTapped(_ sender: Any) {

        var bgColor = String()
        var txtColor = String()
                
        bgColor = colorForBackground?.toHexString() ?? "ddayBlack"
        txtColor = colorForTXT?.toHexString() ?? "ddayWhite"

        print("bgColor: \(bgColor)")
        print("txtColor: \(txtColor)")

        // UserDefaults에 추가
        let newDdayInfo = DdayInfo(title: txtFieldForTitle.text!, subTitle: txtFieldForSubtitle.text!, date: theDate, widgetTextColor: bgColor, widgetBGColor: txtColor, language: language)
        
//        let userDefaults = UserDefaults(suiteName: "group.dday.ddayApp")
        
        // UserDefaults 불러오기 (encode UserDefaults)
//        let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] ?? []
        let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []

        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
        
        // struct list에 추가될 새 struct 넣어주기
        ddayList.append(newDdayInfo)
        
        // UserDefaults에 바뀐 struct list 저장하기 (decode UserDefaults)
        let data = ddayList.map { try? JSONEncoder().encode($0) }
//        UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
        UserDefaults.shared.setValue(data, forKey: KeyForUserDefaults)

        // User Default for date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"

//        self.dismiss(animated: true)
        self.presentingViewController?.dismiss(animated: true)
    }
}

extension AddViewController: DatePickerCellDelegate {
    func getDateValue(value date: Date) {
        self.theDate = date
        self.smallDayNumber.text = String(calculateDday())
        self.largeDayNumber.text = self.smallDayNumber.text
        
        self.mediumDate.text = dateFormatToString(from: date)
        self.mediumDate2.text = self.mediumDate.text
        
        fontConfigurationForDateOfSmall()
        fontConfigurationForMedium1()
        fontConfigurationForMedium2()
        fontConfigurationForLarge()
        fontConfigurationForTitleForSmall()
    }
}
    
extension AddViewController: ColorWellCellDelegate {
    // ColorWellCellDelegate method 구현
    func changeBGColor(bgColor color: UIColor?) {
        // small
        smallView.backgroundColor = color
        // medium 1
        mediumView.backgroundColor = color
        // medium 2
        mediumView2.backgroundColor = color
        // large 1
        
        colorForBackground = color
    }
    
    // ColorWellCellDelegate method 구현
    func changeTxtColor(txtColor color: UIColor?) {
        // small
        smallDday.textColor = color
        smallDayNumber.textColor = color
        smallTitle.textColor = color
        // medium 1
        mediumTitle.textColor = color
        mediumDate.textColor = color
        mediumDday.textColor = color
        // medium 2
        mediumDday2.textColor = color
        mediumTitle2.textColor = color
        mediumDayNumber2.textColor = color
        mediumDate2.textColor = color
        // large 1
        
        colorForTXT = color
    }
    
    // ColorWellCellDelegate method 구현
    func changeBothColor(bg bgColor: UIColor?, txt txtColor: UIColor?) {
        // widget - txt
        // small
        smallDday.textColor = txtColor
        smallPlus.textColor = txtColor
        smallDayNumber.textColor = txtColor
        smallTitle.textColor = txtColor
        // medium 1
        mediumDday.textColor = txtColor
        mediumTitle.textColor = txtColor
        mediumDate.textColor = txtColor
        // medium 2
        mediumDday2.textColor = txtColor
        mediumTitle2.textColor = txtColor
        mediumDayNumber2.textColor = txtColor
        mediumDate2.textColor = txtColor
        // large 1
        
        colorForTXT = txtColor
        
        // widget - bg
        // small
        smallView.backgroundColor = bgColor
        // medium 1
        mediumView.backgroundColor = bgColor
        // medium 2
        mediumView2.backgroundColor = bgColor
        // large 1
        
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
                txtFieldForTitle.placeholder = "입력하기"
            } else { // subtitle row
                txtFieldForSubtitle = cellForTxtfield.accTextField
                cellForTxtfield.accTextField.addTarget(self, action: #selector(getSubTitle), for: .editingDidEnd)
                txtFieldForSubtitle.placeholder = "입력하기"

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
