//
//  WidgetView_Multi01.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi01EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
        case .systemMedium:
            
            // 1. 위젯 초기(tableview list읽어온 데이터 없을시) 보여지는 default CustomSymbol array
            let defaultDdaySymbolMenu: [DdaySymbol] = [
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayBlack", subtitle: "2050.01.01", image: nil),
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
                DdaySymbol(identifier: "ddayNeonYellow", display: "길게눌러서 디데이 추가하기"),
            ]
            
            // 2. 위젯 편집후 불러오는 CustomSymbol array
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            ZStack{
                // top stack 1
                ZStack{
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2099.02.28")
                        .font(.custom("Inter-Bold", size: 7.0))
                        .frame(width: 60, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                    
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                            .font(.custom("Inter-Bold", size: 9.0))
                            .frame(width: 80, height: 50, alignment: .topTrailing)
                            .padding(EdgeInsets(top: 0, leading: 62, bottom: 1, trailing: 0))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                    
                        Text("-999")
                            .font(.custom("Inter-Bold", size: 58.0))
                            .frame(width: 150, height: 50, alignment: .topLeading)
                            .padding(EdgeInsets(top: 15, leading: 5, bottom: 0, trailing: 0))
                            .kerning(-3)
                            .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                }
                .frame(width: 155, height: 70)
                .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 75, trailing: 210))
                
                
                // top stack 2
                ZStack{
                    Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 9.0)) // 4-12
                        .frame(width: 100, height: 50, alignment: .topLeading)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 65))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    
                    Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2099.02.28")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 60, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 5, leading: 95, bottom: 0, trailing: 0))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                    
                    Text("-999")
                        .font(.custom("Inter-Bold", size: 58.0))
                        .frame(width: 150, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 5, leading: 25, bottom: 0, trailing: 0))
                        .kerning(-4)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        .clipped()
                }
                .frame(width: 190, height: 63)
                .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 4)
                .padding(EdgeInsets(top: 0, leading: 170, bottom: 63, trailing: 0))
                
                
                // bottom stack 1
                ZStack{
                    Text(ddaySymbolMenu[safe: 2]?.subtitleString ?? "2099.02.27")
                        .font(.custom("Inter-Bold", size: 7.0))
                        .frame(width: 60, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 90))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                        
                    Text(ddaySymbolMenu[safe: 2]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 9.0)) // 많이-9, 4-12
                        .frame(width: 46, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 5, leading: 110, bottom: 0, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        
                    Text("+1")
                        .font(.custom("Inter-Bold", size: 54.0))
                        .frame(width: 170, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 3))
                        .kerning(-5)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                        .clipped()
                }
                .frame(width: 170, height: 60)
                .border(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"), width: 4)
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 180))
                
                
                // bottom stack 2
                ZStack{
                    Text(ddaySymbolMenu[safe: 3]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 8.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 50, alignment: .topLeading)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        
                    
                    Text(ddaySymbolMenu[safe: 3]?.subtitleString ?? "2099.02.26")
                        .font(.custom("Inter-Bold", size: 8.0))
                        .frame(width: 60, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                        
                    Text("+999")
                        .font(.custom("Inter-Bold", size: 58.0))
                        .frame(width: 150, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 7, leading: 0, bottom: 0, trailing: 22))
                        .kerning(-4)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
                }
                .frame(width: 185, height: 65)
                .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayBlack"))
                .padding(EdgeInsets(top: 84, leading: 210, bottom: 0, trailing: 0))
            }
            .frame(height: 200)
            .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonYellow"))
            
            
        case .systemLarge:
            // 1. 위젯 초기(tableview list읽어온 데이터 없을시) 보여지는 default CustomSymbol array
            let defaultDdaySymbolMenu: [DdaySymbol] = [
                DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonGreen", subtitle: "2050.01.01", image: nil),
                DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기"),
                DdaySymbol(identifier: "ddayNeonPink", display: "길게눌러서 디데이 추가하기"),
            ]
            
            // 2. 위젯 편집후 불러오는 CustomSymbol array
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu
            
            HStack(spacing: 20) {
                ZStack {
                    Text(ddaySymbolMenu[safe: 0]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
                    
                    Text(ddaySymbolMenu[safe: 0]?.subtitleString ?? "2099.01.30")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 70, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 45))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
                
                    
                    Text("+999")
                        .font(.custom("Inter-Bold", size: 66.0))
                        .frame(width: 68, height: 350, alignment: .top)
                        .padding(EdgeInsets(top: 110, leading: 40, bottom: 0, trailing: 0))
                        .kerning(-4)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
                    
                }
                .frame(width: 80, height: 400)
                .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
                
                ZStack {
                    Text(ddaySymbolMenu[safe: 1]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 12.0)) // 4- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
                    
                    Text(ddaySymbolMenu[safe: 1]?.subtitleString ?? "2099.02.28")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 70, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 45))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
                    
                    Text("+999")
                        .font(.custom("Inter-Bold", size: 66.0))
                        .frame(width: 40, height: 350, alignment: .top)
                        .padding(EdgeInsets(top: 110, leading: 40, bottom: 0, trailing: 0))
                        .kerning(-4)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
                }
                .frame(width: 80, height: 400)
                .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
                
                ZStack {
                    Text(ddaySymbolMenu[safe: 2]?.displayString ?? "길게눌러서 디데이 추가하기")
                        .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
                    
                    Text(ddaySymbolMenu[safe: 2]?.subtitleString ?? "2099.03.30")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 70, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 295, leading: 0, bottom: 0, trailing: 45))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
                    
                    Text("+999")
                        .font(.custom("Inter-Bold", size: 66.0))
                        .frame(width: 68, height: 350, alignment: .top)
                        .padding(EdgeInsets(top: 110, leading: 40, bottom: 0, trailing: 0))
                        .kerning(-4)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
                }
                .frame(width: 80, height: 400)
                .background(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonGreen"))
            }
            .frame(width: 400, height: 400)
            .background(Color(ddaySymbolMenu[safe: 0]?.identifier ?? "ddayNeonPink"))
            
        @unknown default:
            Text("Sorry, You have encountered Default Error.")
        }
    }
}

// Multi Medium03, Large01
struct WidgetView_Multi01: Widget {
    let kind: String = "WidgetView_Multi01"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi01EntryView(entry: entry)
        }
        .configurationDisplayName("#1 심플 위젯")
        .description("한 개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct WidgetView_Multi01_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi01EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct WidgetView_Multi01_Previews2: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi01EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
