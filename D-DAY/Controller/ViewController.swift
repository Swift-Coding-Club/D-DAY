//
//  ViewController.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/14.
//

import UIKit

class ViewController: UIViewController, CALayerDelegate {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleView: UIView!
    
    var lifePointsInt = Int()
    var testValue: Int = 0
    
    // UserDefaults 넣어 줄 struct list
    var ddayList = [DdayInfo]()
    
    // Variable for Countdown
    var isTodayCounted = false
    
    private var gradient: CAGradientLayer!
    
    // Persist the top view height constraint
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleViewTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    
    // Original height of the top view
    var viewHeight: CGFloat = 131
    
    // Keep track of the
    private var isAnimationInProgress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // titleView shape
        titleView.layer.cornerRadius = 20
        titleView.layer.shadowColor = UIColor.gray.cgColor
        titleView.layer.shadowOpacity = 0.8
        titleView.layer.shadowOffset = CGSize(width: 3, height: 3) // 그림자 위치
        titleView.layer.shadowRadius = 2 // 그림자 경계의 선명도
        
        // tableView load
        tableView.delegate = self
        tableView.dataSource = self
        
        // tableView drag&drop delegate to reordering cell
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        
        // DDAYCell XIB파일 등록
        tableView.register(UINib(nibName: "DDAYCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
                
        // 추가하기 버튼 shadow 효과
        addButton.layer.shadowColor = UIColor.gray.cgColor
        addButton.layer.shadowOpacity = 0.3
        addButton.layer.shadowOffset = CGSize(width: 3, height: 3) // 그림자 위치
        addButton.layer.shadowRadius = 3 // 그림자 경계의 선명도

        gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.1, 0.9, 1]
        gradient.delegate = self
        tableView.layer.mask = gradient

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        gradient.colors = [UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]

        updateGradientFrame()
    }
    
    // MARK: - CALayerDelegate
    func action(for layer: CALayer, forKey event: String) -> CAAction? {
        return NSNull()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UserDefaults 불러오기 (encode UserDefaults)
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
    
    // Navigation Bar - right bar button item (Edit) 클릭 시
    @IBAction func editDDAY(_ sender: Any) {
//        true: appearance or disappearance of the insertion/deletion/reordering control
//        (false to make the transition immediate)
        
        if self.tableView.isEditing { // edit mode가 아닐 때 (setEditing true -> false)
            addButton.isHidden = false
            
            // TODO: sendDataToExtension 실행으로 인해 animated: true가 실행이 안됨
            sendDataToExtension(ddayListToSave: ddayList)
            
        } else { // edit mode일 떄 (setEditing false -> true)
            addButton.isHidden = true
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
        
        return self.isTodayCounted ? (timeInterval.day! + 1) : timeInterval.day!
    }
    
    // 변경된 tableView 값을 UserDefaults에 저장하고, 다시 불러와서 tableView reload
    func sendDataToExtension(ddayListToSave: [DdayInfo]) {
        // UserDefaults에 바뀐 struct list 저장하기 (decode UserDefaults)
        let data = ddayList.map { try? JSONEncoder().encode($0) }
        UserDefaults.shared.setValue(data, forKey: KeyForUserDefaults)
            
        // UserDefaults 불러오기 (encode UserDefaults)
        let encodedData = UserDefaults.shared.array(forKey: KeyForUserDefaults) as? [Data] ?? []
            
        // 불러온 UserDefaults를 struct list에 넣어주기
        ddayList = encodedData.map { try! JSONDecoder().decode(DdayInfo.self, from: $0) }
        
        tableView.reloadData()
    }
}

// MARK: DataSource: table view의 cell을 호출해 주는 역할
extension ViewController: UITableViewDataSource{
    // 한 section 안에 몇개의 rows가 있을 건지 알려주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ddayList.count
    }
    
    // cell 불러오는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! DDAYCell

        cell.mainTitle.text = ddayList[indexPath.row].title
        cell.subtitle.text = ddayList[indexPath.row].subTitle
        // TODO: dateFormatter DDAY Cell에 따로 모으기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let formattedString = dateFormatter.string(from: ddayList[indexPath.row].date)
        cell.date.text = formattedString
        
        self.isTodayCounted = ddayList[indexPath.row].isTodayCounted
        
        let dateToCalculate = calculateDday(storedDate: ddayList[indexPath.row].date)
        
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
        
        return cell
    }
    
    // trailingSwipeActionsConfigurationForRowAt: table view의 cell을 swipe 했을 때
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // delete action 생성
        let delete = UIContextualAction(style: .destructive, title: "delete") {
            action, view, completion in
            self.ddayList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // UserDefaults에 업데이트
            self.sendDataToExtension(ddayListToSave: self.ddayList)
        }
        delete.image = UIImage(systemName: "trash.fill")
        

        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    // tableView의 cell 이동 시
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let targetItem: DdayInfo = self.ddayList[sourceIndexPath.row]
        self.ddayList.remove(at: sourceIndexPath.row)
        self.ddayList.insert(targetItem, at: destinationIndexPath.row)
        
        // UserDefaults에 업데이트
        self.sendDataToExtension(ddayListToSave: self.ddayList)
    }

}

// MARK: TableView Drage Delegate to reorder cell
extension ViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
}

// MARK: TableView Drop Delegate to reorder cell
extension ViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {

        if session.localDragSession != nil { // 앱 내부에서 드래그가 발생했을 때
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }

        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }

    // 사용자가 드롭을 완료할 때 (드래그 후 스크린에서 손가락을 뗄 때)
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {}
}
    
// MARK: Delegate: table view 클릭 시 interaction
extension ViewController: UITableViewDelegate {
    // cell 클릭 시 MainEditVC로 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! DDAYCell
        
        cell.tag = indexPath.row
                
        let storyboard = UIStoryboard(name: "MainEdit", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(identifier: "EditViewController") as? EditViewController else {
                return
            }
        nextVC.cellTag = cell.tag
        
        self.present(nextVC, animated: true, completion: nil)
    }
}

// MARK: UserDefaults AppGroup
extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.dday.ddayApp"
        return UserDefaults(suiteName: appGroupId)!
    }
}

// MARK: UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        updateGradientFrame()
        
        // Check if the animation is locked or not
        if !isAnimationInProgress {
            
            // Check if an animation is required
            if scrollView.contentOffset.y > .zero &&
                topViewHeightConstraint.constant > .zero { // 스크롤을 내리고 있을 때
                
                scrollViewTopConstraint.constant = .zero
                topViewHeightConstraint.constant = .zero
                
                animateTopViewHeight()
                
                gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]

            }
            else if scrollView.contentOffset.y <= .zero
                        && topViewHeightConstraint.constant <= .zero { // 스크롤을 맨위로 다 올렸을 때

                scrollViewTopConstraint.constant = 20
                topViewHeightConstraint.constant = viewHeight
                
                animateTopViewHeight2()

                gradient.colors = [UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
            }

        }
    }
    
    // MARK: 스크롤뷰의 drag animation이 끝난 후 (위치가 맨 밑일 경우 실행)
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        }
    }
    
    // table view 맨위 맨끝 그라데이션
    private func updateGradientFrame() {
        gradient.frame = CGRect(
            x: 0,
            y: tableView.contentOffset.y,
            width: tableView.bounds.width,
            height: tableView.bounds.height
        )
    }
    
    // 스크롤 down - title view 사라지게
    private func animateTopViewHeight() {
        // Lock the animation functionality
        isAnimationInProgress = true
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.titleViewLeadingConstraint.constant = 0
            self.titleView.frame.size.height = 0
            self.titleView.alpha = 0
            
            self.view.layoutIfNeeded()
            
        }, completion: { [weak self] (_) in

            self?.navigationController?.navigationBar.barTintColor = self?.titleView.backgroundColor
            
            // Unlock the animation functionality
            self?.isAnimationInProgress = false
        })
    }
    
    // 스크롤 up - title view 다시 생기게
    private func animateTopViewHeight2() {
        // Lock the animation functionality
        isAnimationInProgress = true
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.titleViewLeadingConstraint.constant = -20
            self.titleView.frame.size.height = self.viewHeight
            self.titleView.alpha = 1
            
            self.view.layoutIfNeeded()
            
        }, completion: { [weak self] (_) in

            self?.navigationController?.navigationBar.barTintColor = UIColor.white

            // Unlock the animation functionality
            self?.isAnimationInProgress = false
        })
    }
}

