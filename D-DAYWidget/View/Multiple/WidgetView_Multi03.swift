//
//  WidgetView_Multi03.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi03EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
            
        case .systemLarge:
            
            VStack(spacing: 20) {
                ZStack {
                    Text("-124")
                        .font(.custom("Inter-Bold", size: 113.0))
                        .frame(width: 400, height: 50, alignment: .leading)
                        .padding(EdgeInsets(top: 13, leading: 40, bottom: 25, trailing: 0))
                        .kerning(-8)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color("ddayNeonGreen"))
                    
                    Text("아빠 60번째 생일기념 여행")
                        .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 240, bottom: 0, trailing: 0))
                        .lineLimit(3)
                        .foregroundColor(Color("ddayNeonGreen"))

                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 10.0))
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 80, leading: 240, bottom: 0, trailing: 0))
                        .foregroundColor(Color("ddayNeonGreen"))
                }
                .frame(width: 400, height: 80)
                .background(.black)
                .clipped()
                
                ZStack {
                    Text("+34")
                        .font(.custom("Inter-Bold", size: 113.0))
                        .frame(width: 400, height: 50, alignment: .trailing)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 70))
                        .kerning(-10)
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(.black)
                    
                    Text("졸업여행")
                        .font(.custom("Inter-Bold", size: 14.0)) // 2- 16, 4- 14 5~-12
                        .frame(width: 70, height: 55, alignment: .topLeading)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 240))
                        .lineLimit(3)
                        .foregroundColor(.black)

                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 10.0))
                        .frame(width: 70, height: 50, alignment: .topLeading)
                        .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 240))
                        .foregroundColor(.black)
                }
                .frame(width: 400, height: 80)
                .background(Color("ddayNeonGreen"))
                .clipped()
                
                ZStack {
                    Text("30번째 생일")
                        .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 240, bottom: 0, trailing: 0))
                        .lineLimit(3)
                        .foregroundColor(Color("ddayNeonGreen"))

                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 10.0))
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 80, leading: 240, bottom: 0, trailing: 0))
                        .foregroundColor(Color("ddayNeonGreen"))
                    
                    Text("-999")
                        .font(.custom("Inter-Bold", size: 113.0))
                        .frame(width: 400, height: 50, alignment: .leading)
                        .padding(EdgeInsets(top: 13, leading: 40, bottom: 25, trailing: 0))
                        .kerning(-9) // 124-8, 999- 9
                        .rotationEffect(.degrees(-10))
                        .foregroundColor(Color("ddayNeonGreen"))
                }
                .frame(width: 400, height: 80)
                .background(.black)
                .clipped()
                
            }
            .frame(width: 400, height: 400)
            .background(Color("ddayNeonGreen"))
            
        @unknown default:
            Text("Sorry, You have encountered Default Error.")
        }
    }
}

// Multi Large02
struct WidgetView_Multi03: Widget {
    let kind: String = "WidgetView_Multi03"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi02EntryView(entry: entry)
        }
        .configurationDisplayName("#2 다중 위젯")
        .description("여러개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemLarge])
    }
}

struct WidgetView_Multi03_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi03EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
