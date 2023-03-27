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
    @IBOutlet weak var smallDayNumber: UILabel!
    @IBOutlet weak var smallTitle: UILabel!
    
    // widget - medium
    @IBOutlet weak var mediumView: UIView!
    @IBOutlet weak var mediumDday: UILabel!
    @IBOutlet weak var mediumDayNumber: UILabel!
    @IBOutlet weak var mediumTitle: UILabel!
    @IBOutlet weak var mediumDate: UILabel!
    
    @IBOutlet weak var languageButton: UIButton!
    
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
    var colorForTXT: UIColor? = UIColor(hex: "ddayNeonGreen")
    var colorForBackground: UIColor? = UIColor(hex: "ddayBlack")
    
    // UserDefaults 넣어 줄 struct list
    var ddayList = [DdayInfo]()
    
    // Language
    var language: String = "English"

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupPopUpLanguageButton()
    }
}

extension AddViewController {
    
    /****
     IBAction for '취소(cancel)' button
     */
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    /****
     IBAction for '저장(save)' button
     */
    @IBAction func saveButtonTapped(_ sender: Any) {

        var bgColor = String()
        var txtColor = String()
                
        bgColor = colorForBackground?.toHexString() ?? "ddayBlack"
        txtColor = colorForTXT?.toHexString() ?? "ddayWhite"

        // TODO: isTodayCounted 추가했어요 (수정 후 이 코멘트 삭제)
        // UserDefaults에 추가
        let newDdayInfo = DdayInfo(title: self.txtFieldForTitle.text!, subTitle: self.txtFieldForSubtitle.text!, date: self.theDate, isTodayCounted: false, widgetTextColor: txtColor, widgetBGColor: bgColor, language: self.language)
                
        let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []

        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
        
        // struct list에 추가될 새 struct 넣어주기
        ddayList.append(newDdayInfo)
        
        // UserDefaults에 바뀐 struct list 저장하기 (decode UserDefaults)
        let data = ddayList.map { try? JSONEncoder().encode($0) }
        UserDefaults.shared.setValue(data, forKey: KeyForUserDefaults)

        // User Default for date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        // self.dismiss(animated: true)
        self.presentingViewController?.dismiss(animated: true)
    }
    
    func configuration() {
        addTableView.sectionHeaderTopPadding = 50
        addTableView.isScrollEnabled = false
        
        saveButton.isEnabled = false
        
        addTableView.dataSource = self
        addTableView.delegate = self
        
        languageButton.layer.borderWidth = 1
        languageButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        fontConfigurationForSmall()
        fontConfigurationForMedium()
    }
    
    /****
     D-day 날짜 계산
     */
    func calculateDday(_ ddayRecievedDate: Date) -> Int {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        // Date Picker에서 선택한 날짜 (formattedCurrentDate)
        let ddayRecievedDate_Str = dateFormatter.string(from: ddayRecievedDate)
        let formattedTargetDate = dateFormatter.date(from: ddayRecievedDate_Str)!
        
        // 현재날짜 (formattedCurrentDate)
        let currentDateString = dateFormatter.string(from: Date())
        let formattedCurrentDate = dateFormatter.date(from: currentDateString)!
        
        let timeInterval = Calendar.current.dateComponents([.day], from: formattedTargetDate, to: formattedCurrentDate)
        
        return timeInterval.day!
    }
    
    /****
     Configuration For Widget - Small
     */
    func fontConfigurationForSmall() {
        // D
        self.smallDday.font = UIFont(name: "Inter-Bold", size: 113.0)
        self.smallDday.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        // D - Shadow
        self.smallDday.layer.shadowOffset = CGSize(width: 3, height: 5)
        self.smallDday.layer.shadowOpacity = 0.3
        self.smallDday.layer.shadowRadius = 2
        self.smallDday.layer.shadowColor = CGColor.init(srgbRed: 0.09, green: 0.09, blue: 0.09, alpha: 0.8)
        
        // Title
        smallTitle.font = smallTitle.font.withSize(13)
        
        // Day Number
        self.smallDayNumber.font = UIFont(name: "Inter-Bold", size: 118.0)
        self.smallDayNumber.transform = CGAffineTransform(rotationAngle: .pi * -0.04)
        self.smallDayNumber.addCharacterSpacing()
        // Day Number - Shadow
        self.smallDayNumber.layer.shadowOffset = CGSize(width: 3, height: 5)
        self.smallDayNumber.layer.shadowOpacity = 0.3
        self.smallDayNumber.layer.shadowRadius = 2
        self.smallDayNumber.layer.shadowColor = CGColor.init(srgbRed: 0.09, green: 0.09, blue: 0.09, alpha: 0.8)
        
        self.smallView.layer.cornerRadius = 20
        self.smallView.clipsToBounds = true
    }
    
    /****
     Configuration For Widget - Medium
     */
    func fontConfigurationForMedium() {
        // Language
        languageButtonConfiguration(lan: language)
        // D
        self.mediumDday.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
        // Title
        self.mediumTitle.font = UIFont(name: "Inter-Bold", size: 14.0)
        // Day Number
        self.mediumDayNumber.font = UIFont(name: "Inter-Bold", size: 132.0)
        self.mediumDayNumber.transform = CGAffineTransform(rotationAngle: .pi * -0.06)
        self.mediumDayNumber.addCharacterSpacing(-0.09)

        // Date
        self.mediumDate.font = UIFont(name: "Inter-Medium", size: 10.0)
        
        self.mediumView.layer.cornerRadius = 20
        self.mediumView.clipsToBounds = true
        
    }
    
    /****
     Item List For Language Button - Medium
     */
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
        ])
        languageButton.layer.cornerRadius = 10
    }
    
    /****
     Configuration For Language Button - Medium
     */
    func languageButtonConfiguration(lan: String) {
        switch lan {
        case "English":
            self.mediumDday.text = "Dday"
            self.mediumDday.font = UIFont(name: "Inter-Bold", size: 69.0)
            self.mediumDday.addCharacterSpacing(-0.03)
            self.mediumDday.transform = CGAffineTransform(rotationAngle: .pi * -0.08)
            
            self.mediumDday.bottomAnchor.constraint(
                equalTo: self.mediumView.bottomAnchor, constant: -70
            ).isActive = true
            
        case "Korean":
            self.mediumDday.text = "디데이"
            self.mediumDday.font = UIFont(name: "Inter-Bold", size: 68.0)
            self.mediumDday.addCharacterSpacing(-0.03)
            self.mediumDday.transform = CGAffineTransform(rotationAngle: .pi * -0.05)
            
            self.mediumDday.bottomAnchor.constraint(
                equalTo: self.mediumView.bottomAnchor, constant: 90
            ).isActive = true
            
        case "Japanese":
            self.mediumDday.text = "ディ-デ-"
            self.mediumDday.font = UIFont(name: "Inter-Bold", size: 62.0)
            self.mediumDday.addCharacterSpacing(-0.15)
            self.mediumDday.transform = CGAffineTransform(rotationAngle: .pi * -0.05)
            
            self.mediumDday.bottomAnchor.constraint(
                equalTo: self.mediumView.bottomAnchor, constant: 120
            ).isActive = true
            
        default:
            break
        }
        
    }
    
    /****
     Title 업데이트시 불러옴
     */
    func changeTitle(value title: String?) {
        //self.smallTitle.text = title
        //self.mediumTitle.text = title
        if self.titleString?.count == 0 {
            self.saveButton.isEnabled = false
        } else {
            self.saveButton.isEnabled = true
        }
    }
}

/****
 DatePickerCell Delegate
 */
extension AddViewController: DatePickerCellDelegate {
    func getDateValue(value date: Date) {
        self.theDate = date
        //self.smallDayNumber.text = String(calculateDday(self.theDate))
    }
}

/****
 ColorWellCell Delegate
 */
extension AddViewController: ColorWellCellDelegate {
    
    // Background Color Change
    func changeBGColor(bgColor color: UIColor?) {
        // small
        smallView.backgroundColor = color
        // medium
        mediumView.backgroundColor = color
        
        colorForBackground = color
    }
    
    // Text Color Change
    func changeTxtColor(txtColor color: UIColor?) {
        // small
        smallDday.textColor = color
        smallDayNumber.textColor = color
        smallTitle.textColor = color
        // medium
        mediumDday.textColor = color
        mediumTitle.textColor = color
        mediumDayNumber.textColor = color
        mediumDate.textColor = color
        
        colorForTXT = color
    }
    
    // Background & Text Color Change
    func changeBothColor(bg bgColor: UIColor?, txt txtColor: UIColor?) {
        // widget - txt
        // small
        smallDday.textColor = txtColor
        smallDayNumber.textColor = txtColor
        smallTitle.textColor = txtColor
        // medium
        mediumDday.textColor = txtColor
        mediumTitle.textColor = txtColor
        mediumDayNumber.textColor = txtColor
        mediumDate.textColor = txtColor
        
        colorForTXT = txtColor
        
        // widget - bg
        // small
        smallView.backgroundColor = bgColor
        // medium
        mediumView.backgroundColor = bgColor
        
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
//                txtFieldForTitle.placeholder = "입력하기"
                txtFieldForTitle.placeholder = NSLocalizedString("입력하기", comment: "") // 지역화 객체

            } else { // subtitle row
                txtFieldForSubtitle = cellForTxtfield.accTextField
                cellForTxtfield.accTextField.addTarget(self, action: #selector(getSubTitle), for: .editingDidEnd)
//                txtFieldForSubtitle.placeholder = "입력하기"
                txtFieldForSubtitle.placeholder = NSLocalizedString("입력하기", comment: "") // 지역화 객체

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
