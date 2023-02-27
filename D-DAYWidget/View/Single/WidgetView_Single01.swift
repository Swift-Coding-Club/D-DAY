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
            // 1. 위젯 초기(tableview list읽어온 데이터 없을시) 보여지는 default CustomSymbol array
            let defaultDdaySymbolMenu: [DdaySymbol] = [
                DdaySymbol(identifier: "ddayBlack", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayWhite", subtitle: "2050.01.01", image: nil),
            ]
            
            // 2. 위젯 편집후 불러오는 CustomSymbol array
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            ZStack {
                ZStack() {
                    Text("D")
                        .position(x: 7, y: -20)
                        .frame(width: 85, height: 36, alignment: .leading)
                        .font(.custom("Inter-Bold", size: 100))
                    //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                        .rotationEffect(.degrees(-13))
                        .multilineTextAlignment(.leading)
                    
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 48, trailing: -60))
                    //                    .font(.system(size: 12.0))
                        .font(.custom("Inter-Bold", size: 10.0))
                        .multilineTextAlignment(.trailing)
                }
                .position(x: 80,y: 64)
                .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayWhite"))
                
                Text("89")
                    .frame(width: 180, alignment: .leading)
                    .font(.custom("Inter-Bold", size: 118.0)) // 124 - 107, 89 - 118
                //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                    .multilineTextAlignment(.leading)
                    .kerning(-10)
                    .rotationEffect(.degrees(-10))
                    .position(x: 82, y: 108)
                    .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayWhite"))
            }
            .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayBlack"))
            
            
        case .systemMedium:
            
            let defaultDdaySymbolMenu: [DdaySymbol] = [
                DdaySymbol(identifier: "ddayNeonGreen", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayBlack", subtitle: "2050.01.01", image: nil),
            ]
            
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            ZStack {
                ZStack {
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 13.0)) // 많-12, 길게눌러-13
                        .frame(width: 200, height: 20, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 110, trailing: 110))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    Text("D-999")
                        .font(.custom("Inter-Bold", size: 128.0))
                        .frame(width: 350, height: 100, alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 5))
                        .multilineTextAlignment(.leading)
                        .kerning(-13)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
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
