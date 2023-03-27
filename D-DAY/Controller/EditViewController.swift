//
//  EditViewController.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/02/07.
//

import UIKit

class EditViewController: UIViewController {
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

    // TODO: isTodayCounted 추가했어요 (수정 후 이 코멘트 삭제)
    var isTodayCounted = false
    
    // Language
    var language: String = "English"
    
    var cellTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // UserDefaults 불러오기 (encode UserDefaults)
        let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []

        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }

        configuration()
        setupPopUpLanguageButton()
    }
}

extension EditViewController {
    
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
        // 변경될 struct
        let editDdayInfo = DdayInfo(title: self.txtFieldForTitle.text!, subTitle: self.txtFieldForSubtitle.text!,  date: self.theDate, isTodayCounted: false, widgetTextColor: txtColor, widgetBGColor: bgColor, language: self.language)
                
        // UserDefaults 불러오기 (encode UserDefaults)
        let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []

        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
        
        // struct list 중 cellTag(클릭한 cell의 number)에 해당하는 struct의 값을, 변경된 struct값으로 바꿔주기
        ddayList[cellTag] = editDdayInfo
        
        // UserDefaults에 바뀐 struct list 저장하기 (decode UserDefaults)
        let data = ddayList.map { try? JSONEncoder().encode($0) }
        UserDefaults.shared.setValue(data, forKey: KeyForUserDefaults)
        
        // User Default for date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"

        self.dismiss(animated: true)
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
            
            saveButtonEnabled()
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
        saveButtonEnabled()
    }
    
    /****
     Title 유/무에 따른 '저장'버튼 활성화
     */
    func saveButtonEnabled() {
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
extension EditViewController: DatePickerCellDelegate {
    func getDateValue(value date: Date) {
        self.theDate = date
        //self.smallDayNumber.text = String(calculateDday(self.theDate))
        
        saveButtonEnabled()
    }
}
    
/****
 ColorWellCell Delegate
 */
extension EditViewController: ColorWellCellDelegate {
    
    // ColorWellCellDelegate method 구현
    func changeBGColor(bgColor color: UIColor?) {
        smallView.backgroundColor = color
        mediumView.backgroundColor = color
        
        colorForBackground = color
        
        saveButtonEnabled()
    }
    
    // ColorWellCellDelegate method 구현
    func changeTxtColor(txtColor color: UIColor?) {
        smallDday.textColor = color
        smallDayNumber.textColor = color
        smallTitle.textColor = color
        
        mediumDday.textColor = color
        mediumTitle.textColor = color
        mediumDayNumber.textColor = color
        mediumDate.textColor = color
        
        colorForTXT = color
        
        saveButtonEnabled()
    }
    
    // ColorWellCellDelegate method 구현
    func changeBothColor(bg bgColor: UIColor?, txt txtColor: UIColor?) {
        smallDday.textColor = txtColor
        smallDayNumber.textColor = txtColor
        smallTitle.textColor = txtColor
        
        mediumDday.textColor = txtColor
        mediumTitle.textColor = txtColor
        mediumDayNumber.textColor = txtColor
        mediumDate.textColor = txtColor
        
        colorForTXT = txtColor
        
        smallView.backgroundColor = bgColor
        mediumView.backgroundColor = bgColor
        
        colorForBackground = bgColor
        
        saveButtonEnabled()
    }
}

extension EditViewController: UITableViewDataSource {
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
                
                // place holder 대신 UserDefaults의 입력값 넣어주기
                txtFieldForTitle.text = ddayList[cellTag].title
                
            } else { // subtitle row
                
                txtFieldForSubtitle = cellForTxtfield.accTextField
                cellForTxtfield.accTextField.addTarget(self, action: #selector(getSubTitle), for: .editingChanged)
                
                // place holder 대신 UserDefaults의 입력값 넣어주기
                txtFieldForSubtitle.text = ddayList[cellTag].subTitle
            }
            
            cellForTxtfield.textLabel?.text = "\(target.title)"
            
            return cellForTxtfield
            
        } else if indexPath.section == 1 { // datepicker section
            theDate = ddayList[cellTag].date
            
            let cellForDatepicker = addTableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath) as! DatePickerCell
            cellForDatepicker.textLabel?.text = "\(target.title)"
            
            // UserDefaults의 date값으로 수정
            cellForDatepicker.accDatePicker.date = ddayList[cellTag].date
            self.language = ddayList[cellTag].language ?? "English"
            
            print("self language: \(self.language)")
            print("ddayinfo: \(ddayList[cellTag].language)")
            
            languageButtonConfiguration(lan: self.language)
            
            cellForDatepicker.delegate = self
            
            return cellForDatepicker
            
        } else { // colorwell section
            let cellForColorwell = addTableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath) as! ColorWellCell
            cellForColorwell.textLabel?.text = "\(target.title)"
            
            // UserDefaults의 color값으로 수정
            var bgColor = String()
            var txtColor = String()
            
            bgColor = ddayList[cellTag].widgetBGColor ?? "ddayBlack"
            txtColor = ddayList[cellTag].widgetTextColor ?? "ddayWhite"
            
            print("bg: \(bgColor)")
            print("txt: \(txtColor)")
            
            
            // Setting for Widget Default Color
            self.smallView.backgroundColor = UIColor(hex: bgColor)
            self.smallTitle.textColor  = UIColor(hex: txtColor)
            self.smallDday.textColor  = UIColor(hex: txtColor)
            self.smallDayNumber.textColor  = UIColor(hex: txtColor)
            
            self.mediumView.backgroundColor = UIColor(hex: bgColor)
            self.mediumTitle.textColor  = UIColor(hex: txtColor)
            self.mediumDday.textColor  = UIColor(hex: txtColor)
            self.mediumDate.textColor  = UIColor(hex: txtColor)
            self.mediumDayNumber.textColor  = UIColor(hex: txtColor)
            
            self.colorForTXT = UIColor(hex: txtColor)
            self.colorForBackground = UIColor(hex: bgColor)
            
            // ColorWell에 보이는 값도 UserDefaults의 color값으로 수정
            cellForColorwell.colorwellBackground.selectedColor = UIColor(hex: bgColor)
            cellForColorwell.colorwellText.selectedColor = UIColor(hex: txtColor)

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
        
        saveButtonEnabled()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}

extension EditViewController: UITableViewDelegate {}
