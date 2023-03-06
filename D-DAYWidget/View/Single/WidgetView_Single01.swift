//
//  WidgetView.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Single01EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        switch self.family {
        case .systemSmall:
            let defaultDdaySymbolMenu: [DdaySymbol] = [0].map { index in
                let symbolDdayItem = DdaySymbol (identifier: "identifier", display: "diaplay")
                symbolDdayItem.ddayTitle = "길게눌러서 디데이 추가하기"
                symbolDdayItem.ddayDate = "2023.02.04"
                symbolDdayItem.ddayBgColor = "ddayBlack"
                symbolDdayItem.ddayTxtColor = "ddayWhite"

                return symbolDdayItem
            }
                
            // 2. 위젯 편집후 불러오는 CustomSymbol array
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            var dateInt = calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.ddayDate)!)
            var ddayDorPlus = ddaySetDorPlus(dateIntParam: dateInt)
            
            ZStack {
                ZStack() {
                    switch ddayDorPlus {
                    case "D":
                        Text("D")
                            .position(x: 7, y: -20)
                            .frame(width: 85, height: 36, alignment: .leading)
                            .font(.custom("Inter-Bold", size: 100))
                        //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                            .rotationEffect(.degrees(-13))
                            .multilineTextAlignment(.leading)
                        
                    case "+":
                        Text("+")
                            .position(x: 7, y: -23)
                            .frame(width: 85, height: 36, alignment: .leading)
                            .font(.custom("Inter-Bold", size: 128))
                        //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                            .rotationEffect(.degrees(-13))
                            .multilineTextAlignment(.leading)
                        
                    default:
                        Text("Encountered Error S01-1")
                    }
                    
                    Text(ddaySymbolMenu[safe: 0]?.ddayTitle ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: -60))
                    //                    .font(.system(size: 12.0))
                        .font(.custom("Inter-Bold", size: 10.0))
                        .multilineTextAlignment(.trailing)
                }
                .position(x: 80,y: 64)
                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                
                var dateNumber = dateIntSign(dateIntParam: dateInt)
                switch dateNumber.count {
                case 2:
                    Text("\(dateNumber)")
                        .frame(width: 180, alignment: .leading)
                        .font(.custom("Inter-Bold", size: 118.0)) // 124 - 107, 89 - 118
                    //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                        .multilineTextAlignment(.leading)
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .position(x: 82, y: 108)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                case 3:
                    
                    switch Int(dateNumber)! / 100 {
                    case 1...2:
                        Text("\(dateNumber)")
                            .frame(width: 230, alignment: .leading)
                            .font(.custom("Inter-Bold", size: 110.0)) // 124 - 107, 89 - 118
                        //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                            .multilineTextAlignment(.leading)
                            .kerning(-10)
                            .rotationEffect(.degrees(-10))
                            .position(x: 106, y: 108)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                        
                    case 3...8 :
                        Text("\(dateNumber)")
                            .frame(width: 230, alignment: .leading)
                            .font(.custom("Inter-Bold", size: 106.0)) // 124 - 107, 89 - 118
                        //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                            .multilineTextAlignment(.leading)
                            .kerning(-10)
                            .rotationEffect(.degrees(-10))
                            .position(x: 104, y: 108)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                        
                    case 9 :
                        Text("\(dateNumber)")
                            .frame(width: 230, alignment: .leading)
                            .font(.custom("Inter-Bold", size: 99.0)) // 124 - 107, 89 - 118
                        //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                            .multilineTextAlignment(.leading)
                            .kerning(-10)
                            .rotationEffect(.degrees(-10))
                            .position(x: 105, y: 108)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.ddayTxtColor ?? "ddayWhite"))
                    default:
                        Text("Default Error")
                    }
                    
                default:
                    Text("Encountered Error S01-2")
                }
            }
            .background(Color(ddaySymbolMenu[safe: 0]?.ddayBgColor ?? "ddayBlack"))
            
        case .systemMedium:
            
            let defaultDdaySymbolMenu: [DdaySymbol] = [
                DdaySymbol(identifier: "ddayNeonGreen", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayBlack", subtitle: "2015.12.18", image: nil),
            ]
            
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            var dateInt = calculateDday(ddayRecievedDate: (ddaySymbolMenu[safe: 0]?.subtitleString)!)
            
            ZStack {
                ZStack {
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0)) // 많-12, 길게눌러-13
                        .frame(width: 200, height: 20, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 110, trailing: 110))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    let ddayNumber = dateIntSign(dateIntParam: dateInt)
                    let startIndex = ddayNumber.index(ddayNumber.startIndex, offsetBy: 1)
                    let dayStr = String(ddayNumber[...startIndex]) // D+ / D-
                    
                    switch dateInt <= 0 {
                    case true :
                        switch ddayNumber.count {
                        case 2...3:
                            Text("D-\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 128.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-13)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                        case 4:
                            Text("D-\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 114.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-11)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                        case 5...8:
                            Text("D-\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 100.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-11)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                        default:
                            Text("Default E4")
                        }
                        
                    case false :
                        switch ddayNumber.count {
                        case 2:
                            Text("D+")
                                .font(.custom("Inter-Bold", size: 128.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-15)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                            Text("\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 128.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 343, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-13)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                        case 3:
                            
                            switch Int(ddayNumber)! / 100 {
                            case 1:
                                Text("D+")
                                    .font(.custom("Inter-Bold", size: 128.0))
                                    .frame(width: 400, height: 100, alignment: .leading)
                                    .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                    .multilineTextAlignment(.leading)
                                    .kerning(-15)
                                    .rotationEffect(.degrees(-10))
                                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                                
                                Text("\(ddayNumber)")
                                    .font(.custom("Inter-Bold", size: 128.0))
                                    .frame(width: 400, height: 100, alignment: .leading)
                                    .padding(EdgeInsets(top: 15, leading: 336, bottom: 0, trailing: 0))
                                    .multilineTextAlignment(.leading)
                                    .kerning(-13)
                                    .rotationEffect(.degrees(-10))
                                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                                
                            case 2...9:
                                Text("D+")
                                    .font(.custom("Inter-Bold", size: 124.0))
                                    .frame(width: 400, height: 100, alignment: .leading)
                                    .padding(EdgeInsets(top: 15, leading: 43, bottom: 0, trailing: 0))
                                    .multilineTextAlignment(.leading)
                                    .kerning(-15)
                                    .rotationEffect(.degrees(-10))
                                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                                
                                Text("\(ddayNumber)")
                                    .font(.custom("Inter-Bold", size: 120.0))
                                    .frame(width: 400, height: 100, alignment: .leading)
                                    .padding(EdgeInsets(top: 15, leading: 329, bottom: 0, trailing: 0))
                                    .multilineTextAlignment(.leading)
                                    .kerning(-12)
                                    .rotationEffect(.degrees(-10))
                                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                            default:
                                Text("Default E3")
                            }
                            
                            
                        case 4...8:
                            Text("D")
                                .font(.custom("Inter-Bold", size: 113.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 41, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                            Text("+")
                                .font(.custom("Inter-ExtraBold", size: 87.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 182, bottom: 11, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                            Text("\(ddayNumber)")
                                .font(.custom("Inter-Bold", size: 109.0))
                                .frame(width: 400, height: 100, alignment: .leading)
                                .padding(EdgeInsets(top: 15, leading: 271, bottom: 0, trailing: 0))
                                .multilineTextAlignment(.leading)
                                .kerning(-11)
                                .rotationEffect(.degrees(-10))
                                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            
                        default:
                            Text("Default error2")
                        }
                    default:
                        Text("Default error1")
                    }
                    
                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 10.0))
                        .frame(width: 300, height: 20, alignment: .trailing)
                        .padding(EdgeInsets(top: 120, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                }
            }
            .frame(height: 200)
            .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonGreen"))
            
        @unknown default:
            Text("Sorry, You have encountered Default Error.")
        }
    }
    
    func calculateDday(ddayRecievedDate: String) -> Int {
        // D-day 날짜 계산
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        let formattedTargetDate = dateFormatter.date(from: ddayRecievedDate)!
        
        // 현재시간 (formattedCurrentDate)
        let currentDateString = dateFormatter.string(from: Date())
        let formattedCurrentDate = dateFormatter.date(from: currentDateString)!
        
        let timeInterval = Calendar.current.dateComponents([.day], from: formattedTargetDate, to: formattedCurrentDate)
        
        return timeInterval.day!
    }
    
    func ddaySetDorPlus(dateIntParam: Int) -> String {
        if dateIntParam < 0 {
            return "D"
        } else {
            return "+"
        }
    }
    
    func dateIntSign(dateIntParam: Int) -> String {
        if dateIntParam < 0 {
            return String(format: "%02d", (-1) * dateIntParam)
        } else {
            return String(format: "%02d", dateIntParam)
        }
    }
}

// Single Small01, Medium01
struct WidgetView_Single01: Widget {
    let kind: String = "WidgetView_Single01"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Single01EntryView(entry: entry)
        }
        .configurationDisplayName("#1 심플 위젯")
        .description("한 개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct WidgetView_Single01_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Single01EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct WidgetView_Single01_Previews2: PreviewProvider {
    static var previews: some View {
        WidgetView_Single01EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

extension Array {
    subscript (safe index: Int) -> Element? {
        // iOS 9 or later
        return indices ~= index ? self[index] : nil
        // iOS 8 or earlier
        // return startIndex <= index && index < endIndex ? self[index] : nil
        // return 0 <= index && index < self.count ? self[index] : nil
    }
}
