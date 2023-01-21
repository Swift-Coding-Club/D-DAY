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
    
    // Data for the Table.
    let list = DdaySettingSection.generateData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTableView.sectionHeaderTopPadding = 50
        
        addTableView.dataSource = self
        addTableView.delegate = self
    }
    
    // Define the IBActions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension AddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = list[indexPath.section].items[indexPath.row]
        
        print("target.type.rawValue: \(target.type.rawValue)")
        
        let cell = addTableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        switch target.type {
        case .textfield:
            cell.textLabel?.text = "\(target.title)"
            print("target.title: \(target.title)")
        case .datepicker:
            cell.textLabel?.text = "\(target.title)"
            print("target.title: \(target.title)")
        case .colorwell:
            cell.textLabel?.text = "\(target.title)"
            print("target.title: \(target.title)")
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}

extension AddViewController: UITableViewDelegate {
    
    
}
