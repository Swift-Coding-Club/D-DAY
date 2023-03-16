//
//  WidgetView_Multi03.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi05EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
            
        case .systemLarge:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Multi05_L_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Multi05_L_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error M05-1")
            }
            
        case .systemExtraLarge:
            
            let defaultDdaySymbolMenu: [DdaySymbol] = [
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기 그리고 그리고?", pronunciationHint: "ddayBlack", subtitle: "2050.01.01", image: nil),
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            ]
            
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            ZStack {
                // top stack 1
                ZStack {
                    ZStack {
                        Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2099.02.28")
                            .font(.custom("Inter-Bold", size: 12.0))
                            .frame(width: 100, height: 30, alignment: .topLeading)
                            .position(x: 75, y: 35)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        
                        
                        Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 15.0))
                            .frame(width: 155, height: 50, alignment: .topTrailing)
                            .position(x: 210, y: 42)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        
                        Text("-999")
                            .font(.custom("Inter-Bold", size: 108.0))
                            .frame(width: 400, height: 100, alignment: .topLeading)
                            .position(x: 193, y: 88)
                            .kerning(-10)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    }
                    .frame(width: 310, height: 140)
                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                }
                .position(x: 163, y: 100)
                
                // top stack 2
                ZStack {
                    ZStack {
                        Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 15.0)) // 4-12
//                        Text("길게눌러서 자리매김한")
//                            .font(.custom("Inter-Bold", size: 25.0)) // 4-12
                            .frame(width: 230, height: 70, alignment: .topLeading)
                            .position(x: 133, y: 51)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2099.02.28")
                            .font(.custom("Inter-Bold", size: 12.0))
                            .frame(width: 100, height: 50, alignment: .topTrailing)
                            .position(x: 300, y: 42)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        
                        Text("+9")
                            .font(.custom("Inter-Bold", size: 100.0))
                            .frame(width: 360, height: 100, alignment: .topTrailing)
                            .position(x: 187, y: 70)
                            .kerning(-10)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            .clipped()
                    }
                    .frame(width: 390, height: 116)
                    .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 6)
                }
                .position(x: 560, y: 101)
                
                // bottom stack 1
                ZStack {
                    ZStack {
                        Text(ddaySymbolMenu[safe: 2]?.subtitleString ?? "2024.02.27")
                            .font(.custom("Inter-Bold", size: 12.0))
                            .frame(width: 100, height: 30, alignment: .topLeading)
                            .position(x: 85, y: 35)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
//                        Text(ddaySymbolMenu[safe: 2]?.displayString ?? "길게눌러서 디데이 추가하기")
//                            .font(.custom("Inter-Bold", size: 15.0))
                        Text("유학준비")
                            .font(.custom("Inter-Bold", size: 28.0)) // 2-38
                            .frame(width: 98, height: 180, alignment: .topTrailing)
                            .position(x: 280, y: 106)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        Text("+324")
                            .font(.custom("Inter-Bold", size: 95.0))
//                        Text("+9990")
//                            .font(.custom("Inter-Bold", size: 85.0)) // 글자 ~4개 일때
//                            .kerning(-8)
                            .frame(width: 340, height: 100, alignment: .topLeading)
                            .position(x: 176, y: 78)
                            .kerning(-9)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                            .clipped()
                        
                    }
                    .frame(width: 350, height: 120)
                    .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 6)
                }
                .position(x: 170, y: 265)
                
                // bottom stack 2
                ZStack {
                    ZStack {
                        Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 15.0)) // 4-12
//                        Text("길게눌러서 자리매김한")
//                            .font(.custom("Inter-Bold", size: 25.0)) // 4-12
                            .frame(width: 230, height: 70, alignment: .topLeading)
                            .position(x: 133, y: 51)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    }
                    .frame(width: 352, height: 145)
                    .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                }
                .position(x: 580, y: 260)
            }
            .frame(width: 750, height: 360)
            .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
            
        @unknown default:
            Text("Sorry, You have encountered Default Error.")
        }
    }
}

// Multi Large02
struct WidgetView_Multi05: Widget {
    let kind: String = "WidgetView_Multi05"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi05EntryView(entry: entry)
        }
        .configurationDisplayName("#2 다중 위젯")
        .description("여러개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemLarge, .systemExtraLarge])
    }
}

struct WidgetView_Multi05_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi05EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

struct WidgetView_Multi05_Previews2: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi05EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    }
}
