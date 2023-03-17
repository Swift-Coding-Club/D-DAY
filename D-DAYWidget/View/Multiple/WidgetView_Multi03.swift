//
//  WidgetView_Multi03.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/08.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi03EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
        case .systemMedium:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Multi03_M_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Multi03_M_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error M03-1")
            }
            
        case .systemLarge:
            let defaultDdaySymbolMenu: [DdaySymbol] = [
                DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.01.04", image: nil),
                DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.02.04", image: nil),
                DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.03.04", image: nil),
            ]
            
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            HStack(spacing: 20) {
                WidgetView_Multi03_L_Comp01_1(entry: self.entry).body
                WidgetView_Multi03_L_Comp01_2(entry: self.entry).body
//                WidgetView_Multi03_L_Comp01_3(entry: self.entry).body
                
                let defaultDdaySymbolMenu_sub: [DdaySymbol] = [
                    DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.01.04", image: nil),
                    DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2024.02.04", image: nil),
                    DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2023.02.14", image: nil),
                ]
                
                let ddaySymbolMenu_sub: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu_sub
                
                var dateInt: Int = CustomFunctions().calculateDday(ddayRecievedDate: (ddaySymbolMenu_sub[safe: 2]?.subtitleString ??  "2024.02.16"))
                var ddayDorPlus: String = CustomFunctions().ddaySetDorPlus(dateIntParam: dateInt)
                var _formattedDateInt: String = CustomFunctions().dateIntSign(dateIntParam: dateInt) // 296
                
                var txtStringArr: [String] = [ddayDorPlus]
                var _dateCountArr: [Int] = [_formattedDateInt.count]
                
                let _: [String] = _dateCountArr.map { index in
                    for n in 0..<index {
                        let lastIndex = _formattedDateInt.index(_formattedDateInt.startIndex, offsetBy: n)
                        txtStringArr.append(String(_formattedDateInt[lastIndex]))
                    }
                    return ""
                }
                
                ZStack {
                    Text(ddaySymbolMenu_sub[safe: 2]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                        .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
                    
                    Text(ddaySymbolMenu_sub[safe: 2]?.subtitleString ?? "2019.03.30")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 70, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 45))
                        .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
                    
        //            Text("\(txtStringArr[safe: 0] ?? "E")")
                    Text("D")
                        .font(.custom("Inter-Bold", size: 93.0))
                        .frame(width: 55, height: 20, alignment: .top)
                        .position(x: 70, y: 104)
//                        .position(x: 70, y: 80)
                        .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
                    
                Text("+")
                    .font(.custom("Inter-ExtraBold", size: 50.0))
                    .frame(width: 75, height: 20, alignment: .top)
                    .position(x: 37, y: 175)
                    .kerning(-6)
                    .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
                    Text("\(txtStringArr[safe: 1] ?? "")")
                        .font(.custom("Inter-Bold", size: 95.0))
                        .frame(width: 55, height: 20, alignment: .top)
                        .position(x: 71, y: 170)
                        .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
                    Text("\(txtStringArr[safe: 2] ?? "")")
                        .font(.custom("Inter-Bold", size: 95.0))
                        .frame(width: 55, height: 20, alignment: .top)
                        .position(x: 71, y: 231)
                        .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
                    Text("\(txtStringArr[safe: 3] ?? "")")
                        .font(.custom("Inter-Bold", size: 95.0))
                        .frame(width: 55, height: 20, alignment: .top)
                        .position(x: 71, y: 295)
                        .foregroundColor(Color(ddaySymbolMenu_sub[safe: 0]?.identifier ?? "ddayNeonPink"))
                }
                .frame(width: 80, height: 400)
                .background(Color(ddaySymbolMenu_sub[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            }
            .frame(width: 400, height: 400)
            .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
             
        @unknown default:
            Text("Sorry, You have encountered Default Error.  M03-3")
        }
    }
}

// Multi Medium03, Large01
struct WidgetView_Multi03: Widget {
    let kind: String = "WidgetView_Multi03"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi03EntryView(entry: entry)
        }
        .configurationDisplayName("#2 다중 위젯")
        .description("여러개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct WidgetView_Multi03_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi03EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct WidgetView_Multi03_Previews2: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi03EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
