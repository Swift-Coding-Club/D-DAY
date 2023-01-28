//
//  ModalAddMultiSection.swift
//  D-DAY
//
//  Created by Hakyung Sohn on 2023/01/20.
//

import UIKit

enum CellType: String {
    case textfield
    case datepicker
    case colorwell
}

class DdaySettingItem {
    init(type: CellType, title: String) {
        self.type = type
        self.title = title
    }
    let type: CellType
    let title: String
}

class DdaySettingSection {
    init(items: [DdaySettingItem], header: String? = nil, footer: String? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
    let items: [DdaySettingItem]
    var header: String?
    var footer: String?
    
    static func generateData() -> [DdaySettingSection] {
        let list: [DdaySettingSection] =
        [
            DdaySettingSection(
                items: [
                    DdaySettingItem(type: .textfield, title: "제목"),
                    DdaySettingItem(type: .textfield, title: "추가 설명")
                ]
            ),
            DdaySettingSection(
                items: [
                    DdaySettingItem(type: .datepicker, title: "날짜")
                ]
            ),
            DdaySettingSection(
                items: [
                    DdaySettingItem(type: .colorwell, title: "위젯 색상")
                ]
            ),
        ]
        return list
    }
}
