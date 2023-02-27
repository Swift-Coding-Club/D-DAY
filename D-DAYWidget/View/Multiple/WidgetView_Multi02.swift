//
//  WidgetView_Multi02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi02EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
            
        case .systemLarge:
            
            HStack(spacing: 20) {
                ZStack {
                    Text("아빠 60번째 생일기념 여행")
                        .font(.custom("Inter-Bold", size: 12.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                        .foregroundColor(Color("ddayNeonEmerald"))
                    
                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 195, trailing: 0))
                        .foregroundColor(Color("ddayNeonEmerald"))
                
                    
                    Text("-124")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 400, height: 50, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 25, trailing: 0))
                        .kerning(-9)
                        .rotationEffect(.degrees(-100))
                        .foregroundColor(Color("ddayNeonEmerald"))
                    
                }
                .frame(width: 80, height: 400)
                .background(Color("ddayBabyPurple"))
                .clipped()
                
                ZStack {
                    Text("호주유학")
                        .font(.custom("Inter-Bold", size: 14.0)) // 4- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                        .foregroundColor(Color("ddayBabyPurple"))
                    
                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 195, trailing: 0))
                        .foregroundColor(Color("ddayBabyPurple"))
                
                    
                    Text("-43")
                        .font(.custom("Inter-Bold", size: 110.0))
                        .frame(width: 400, height: 400, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 25, trailing: 0))
                        .clipped()
                        .kerning(-9)
                        .rotationEffect(.degrees(-100))
                        .foregroundColor(Color("ddayBabyPurple"))
                }
                .frame(width: 80, height: 400)
                .clipped()
                
                ZStack {
                    Text("미국여행")
                        .font(.custom("Inter-Bold", size: 14.0)) // 2- 14, 3~5-12, <8=-11,  많이-9
                        .frame(width: 70, height: 55, alignment: .topTrailing)
                        .multilineTextAlignment(.trailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 270, trailing: 0))
                        .foregroundColor(Color("ddayNeonEmerald"))
                    
                    Text("2023.12.31")
                        .font(.custom("Inter-Bold", size: 12.0))
                        .frame(width: 70, height: 50, alignment: .topTrailing)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 195, trailing: 0))
                        .foregroundColor(Color("ddayNeonEmerald"))
                
                    
                    Text("+999")
                        .font(.custom("Inter-Bold", size: 96.0))
                        .frame(width: 400, height: 50, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 25, trailing: 0))
                        .kerning(-9)
                        .rotationEffect(.degrees(-100))
                        .foregroundColor(Color("ddayNeonEmerald"))
                }
                .frame(width: 80, height: 400)
                .background(Color("ddayBabyPurple"))
                .clipped()
                
            }
            .frame(width: 400, height: 400)
            .background(Color("ddayNeonEmerald"))
            
            
        @unknown default:
            Text("Sorry, You have encountered Default Error.")
        }
    }
}

// Multi Large02
struct WidgetView_Multi02: Widget {
    let kind: String = "WidgetView_Multi02"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi02EntryView(entry: entry)
        }
        .configurationDisplayName("#2 다중 위젯")
        .description("여러개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemLarge])
    }
}

struct WidgetView_Multi02_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi02EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
