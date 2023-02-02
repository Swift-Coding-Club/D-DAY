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
    
    // widget - large
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
    
    // UserDefaults 넣어 줄 struct list
    var ddayList = [DdayInfo]()

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
    
    func save(_ existingDdayInfoList: [DdayInfo]) {
        let data = existingDdayInfoList.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: "DdayInfoList")
    }
    
    // IBAction for '저장(save)' button
    @IBAction func saveButtonTapped(_ sender: Any) {

        // UserDefaults에 추가
        let newDdayInfo = DdayInfo(title: txtFieldForTitle.text!, subTitle: txtFieldForSubtitle.text!, date: Date())
        
        // UserDefaults 불러오기 (encode UserDefaults)
        let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] ?? []
        
        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
        
        // struct list에 추가될 새 struct 넣어주기
        ddayList.append(newDdayInfo)
        
        // UserDefaults에 바뀐 struct list 저장하기 (decode UserDefaults)
        let data = ddayList.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
          
        // User Default for date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"

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
