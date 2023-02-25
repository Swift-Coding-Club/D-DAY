//
//  ViewController.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var lifePointsInt = Int()
    var testValue: Int = 0
    
    // UserDefaults 넣어 줄 struct list
    var ddayList = [DdayInfo]()
    
    let editButtonTitle0 = "Edit"
    let editButtonTitle1 = "Done"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad ->")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // DDAYCell XIB파일 등록
        tableView.register(UINib(nibName: "DDAYCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        tableView.isEditing = false

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear ->")
        
//        let userDefaults = UserDefaults(suiteName: "group.dday.ddayApp")
            
        // UserDefaults 불러오기 (encode UserDefaults)
//        let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] ?? []
        let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []
            
        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
        
        // AddViewController가 dismiss될 때마다(== viewWillAppear) table view 리프레시 해주기
        tableView.reloadData()
    }
    
    // 추가하기 버튼 클릭 -> AddViewController로 이동
    @IBAction func addDDAY(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ModalAdd", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        present(viewController, animated: true)
    }
    
    // 수정하기 버튼
    @IBAction func editDDAY(_ sender: Any) {
//        true: appearance or disappearance of the insertion/deletion/reordering control
//        (false to make the transition immediate)
        
        if self.tableView.isEditing { // edit mode가 아닐 때 (setEditing true -> false)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: editButtonTitle0, style: .plain, target: self, action:
            #selector(editDDAY))

            self.tableView.setEditing(false, animated: true)
            
            // TODO: 함수 실행으로 인해 self.tableView.setEditing(false, animated: true)에서의 animated: true가 실행이 안됨
//            saveUserDefaults(ddayListToSave: ddayList) // 바뀐 table view 값 refresh
            sendDataToExtension(ddayListToSave: ddayList)
        } else { // edit mode일 떄 (setEditing false -> true)
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: editButtonTitle1, style: .plain, target: self, action:
            #selector(editDDAY))

            self.tableView.setEditing(true, animated: true)
        }

    }
    
    func dateFormatToString(from value: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        return dateFormatter.string(from: value)
    }
    
    func calculateDday(storedDate: Date) -> Int {
        let targetDateString = dateFormatToString(from: storedDate)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let formattedTargetDate = dateFormatter.date(from: targetDateString)!

        // 현재시간 (formattedCurrentDate)
        let currentDateString = dateFormatToString(from: Date())
        let formattedCurrentDate = dateFormatter.date(from: currentDateString)!

        let timeInterval = Calendar.current.dateComponents([.day], from: formattedTargetDate, to: formattedCurrentDate)
            
        return timeInterval.day!
    }
    
    // edit mode 종료 후 바뀐 table view 값을 다시 UserDefaults에 저장하고, 다시 불러와서 table view에 reload
    func saveUserDefaults(ddayListToSave: [DdayInfo]) {
        // UserDefaults에 바뀐 struct list 저장하기 (decode UserDefaults)
        let data = ddayList.map { try? JSONEncoder().encode($0) }
        UserDefaults.shared.set(data, forKey: KeyForUserDefaults)
        
        // UserDefaults 불러오기 (encode UserDefaults)
        let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []
        
        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
        
        // AddViewController가 dismiss될 때마다(== viewWillAppear) table view 리프레시 해주기
        tableView.reloadData()
    }
    
    func sendDataToExtension(ddayListToSave: [DdayInfo]) {
//        if let userDefaults = UserDefaults(suiteName: "group.dday.ddayApp") {
            let data = ddayList.map { try? JSONEncoder().encode($0) }
            UserDefaults.shared.setValue(data, forKey: KeyForUserDefaults)
            
            // UserDefaults 불러오기 (encode UserDefaults)
            let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []
            
            // 불러온 UserDefaults를 struct list에 넣어주기
            ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
            
            // AddViewController가 dismiss될 때마다(== viewWillAppear) table view 리프레시 해주기
            tableView.reloadData()
//        }
    }
    
}

// MARK: DataSource: table view의 cell을 호출해 주는 역할
extension ViewController: UITableViewDataSource{
    // 한 section 안에 몇개의 rows가 있을 건지 알려주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ddayList.count: \(ddayList.count)")
        return ddayList.count
    }
    
    // cell 불러오는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! DDAYCell

        print("indexPath: \(indexPath)")

        cell.mainTitle.text = ddayList[indexPath.row].title
        cell.subtitle.text = ddayList[indexPath.row].subTitle
        // TODO: dateFormatter DDAY Cell에 따로 모으기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let formattedString = dateFormatter.string(from: ddayList[indexPath.row].date)
        cell.date.text = formattedString
        
        let dateToCalculate = calculateDday(storedDate: ddayList[indexPath.row].date)
        print("dateToCalculate - ddayList[indexPath.row].date: \(ddayList[indexPath.row].date)")
        print("dateToCalculate: \(dateToCalculate)")
        if dateToCalculate > 0 {
            cell.dday.text = "D+" + String(dateToCalculate)
            cell.dday.textColor = .systemBlue
            cell.dday.backgroundColor = .none
        } else if dateToCalculate == 0 {
            cell.dday.text = " D-DAY! "
            cell.dday.textColor = .white
            cell.dday.backgroundColor = .black
        } else {
            cell.dday.text = "D" + String(dateToCalculate)
            cell.dday.textColor = .systemRed
            cell.dday.backgroundColor = .none
        }

        cell.editingAccessoryButton.tag = indexPath.row
        cell.editingAccessoryButton.addTarget(self, action: #selector(editingButtonTapped(sender:)), for: .touchUpInside)

        return cell
    }
    
    @objc func editingButtonTapped(sender: UIButton) {
        print("\(sender.tag) 버튼의 Tag로 index값을 받아서 데이터 처리")
        
        let storyboard = UIStoryboard(name: "MainEdit", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(identifier: "EditViewController") as? EditViewController else {
                return
            }
        nextVC.cellTag = sender.tag
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    // editingStyleForRowAt: table view의 cell별 +, - 모드 지정 (none으로 해줘서 deletion control 없앰)
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // trailingSwipeActionsConfigurationForRowAt: table view의 cell을 swipe 했을 때 삭제 옵션이 나옴
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // delete 버튼
        let delete = UIContextualAction(style: .destructive, title: "delete") {
            action, view, completion in
            self.ddayList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delete.image = UIImage(systemName: "trash.fill")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    // moveRowAt: table view의 cell을 이동시켜 주는 역할
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("\(self.ddayList) from: \(sourceIndexPath.row) -> to: \(destinationIndexPath.row)")
        let targetItem: DdayInfo = self.ddayList[sourceIndexPath.row]
        self.ddayList.remove(at: sourceIndexPath.row)
        self.ddayList.insert(targetItem, at: destinationIndexPath.row)
    }

}
    
// MARK: Delegate: table view를 유저가 눌렀을 떄 interaction 해주는 역할
extension ViewController: UITableViewDelegate {
    // cell을 클릭하면 indexPath.row 출력 하도록 해놨음
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

// MARK: UserDefaults AppGroup
extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.dday.ddayApp"
        return UserDefaults(suiteName: appGroupId)!
    }
}

