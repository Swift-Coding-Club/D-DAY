//
//  ViewController.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var lifePointsInt = Int()
    var testValue: Int = 0
    
    // UserDefaults 넣어 줄 struct list
    var ddayList = [DdayInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad ->")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // DDAYCell XIB파일 등록
        tableView.register(UINib(nibName: "DDAYCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear ->")
        
        // UserDefaults 불러오기 (encode UserDefaults)
        let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] ?? []
        
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

        return cell
    }
}
    
// MARK: Delegate: table view를 유저가 눌렀을 떄 interaction 해주는 역할
extension ViewController: UITableViewDelegate {
    
    // cell을 클릭하면 indexPath.row 출력 하도록 해놨음
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
