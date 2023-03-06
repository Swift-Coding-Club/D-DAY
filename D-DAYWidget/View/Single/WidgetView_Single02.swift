//
//  WidgetView_Single02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Single02EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
        case .systemMedium:

                // 1. 위젯 초기(tableview list읽어온 데이터 없을시) 보여지는 default CustomSymbol array
                let defaultDdaySymbolMenu: [DdaySymbol] = [
                    DdaySymbol(identifier: "ddayNeonBlue", display: "길게눌러서 디데이 추가하기", pronunciationHint: "ddayNeonYellow", subtitle: "2050.01.01", image: nil),
                ]

                // 2. 위젯 편집후 불러오는 CustomSymbol array
            let ddaySymbolMenu: [DdaySymbol] = entry.configuration.ddaySymbol ?? defaultDdaySymbolMenu

            ZStack {
                ZStack {
                    Text("Dday")
                        .font(.custom("Inter-Bold", size: 70.0))
                        .frame(width: 300, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 175, trailing: 20))
                        .kerning(-2)
                        .rotationEffect(.degrees(-13))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))

                    Text("제이슨이 한국에 오는날")
                        .font(.custom("Inter-Bold", size: 14.0)) // 4글자(미국여행)-25, 5>-
                        .frame(width: 75, height: 70, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 230, bottom: 50, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))

                    Text("999")
                        .font(.custom("Inter-Bold", size: 137.0)) // 000-130, 124-145, 999-137
                        .frame(width: 350, height: 100, alignment: .leading)
                        .padding(EdgeInsets(top: 40, leading: 60, bottom: 0, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .kerning(-12) // 000-12, 124- 11
                        .rotationEffect(.degrees(-8))
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))

                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 10.0))
                        .frame(width: 30, height: 70, alignment: .trailing)
                        .padding(EdgeInsets(top: 100, leading: 270, bottom: 0, trailing: 0))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(ddaySymbolMenu[safe: 0]?.pronunciationHint ?? "ddayNeonYellow"))
                }

            }
            .frame(height: 200)
            .background(Color("ddayNeonBlue"))
            
        case .systemLarge:
            ZStack {
                ZStack {
                    Text("D")
                        .font(.custom("Inter-Bold", size: 225.0))
                        .frame(width: 230, height: 36, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 233, trailing: 70))
                    //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                        .rotationEffect(.degrees(-13))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)

//                    Text("매일매일 커피한잔으로 하루 시작하기")
                    Text("Christmas party\nin Canada")
                        .font(.custom("Inter-Bold", size: 17.0))
                        .frame(width: 110, height: 100, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 170, bottom: 200, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(2)
                        .lineLimit(3)
                        .foregroundColor(.black)

                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 10.0))
                        .frame(width: 110, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 170, bottom: 100, trailing: 0))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(2)
                        .foregroundColor(.black)

                    Text("124")
                        .font(.custom("Inter-Bold", size: 223.0)) // 223- 124,
                        .frame(width: 450, alignment: .leading)
                        .padding(EdgeInsets(top: 160, leading: 60, bottom: 0, trailing: 0))
                    //                    .shadow(color: .gray.opacity(0.7), radius: 2, x: -1, y: 3)
                        .multilineTextAlignment(.leading)
                        .kerning(-19) // 124- 16, 24 - 19
                        .rotationEffect(.degrees(-11))
                        .foregroundColor(Color.black)
                }
            }
            .frame(height: 400)
            .background(Color.white)
            
        @unknown default:
            Text("Sorry, You have encountered Default Error.")
        }
    }
}

// Single Medium02
struct WidgetView_Single02: Widget {
    let kind: String = "WidgetView_Single02"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Single02EntryView(entry: entry)
        }
        .configurationDisplayName("#1 심플 위젯")
        .description("한 개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct WidgetView_Single02_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Single02EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct WidgetView_Single02_Previews2: PreviewProvider {
    static var previews: some View {
        WidgetView_Single02EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
