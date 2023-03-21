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
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                HStack(spacing: 20) {
                    WidgetView_Multi03_L_Comp01_1(entry: self.entry).body
                    WidgetView_Multi03_L_Comp01_2(entry: self.entry).body
                    WidgetView_Multi03_L_Comp01_3(entry: self.entry).body
                }
                .frame(width: 400, height: 400)
//                .background(Color(entry.configuration.ddaySymbol?[safe: 0]?.ddayBgColor ?? "ddayNeonPink"))
                .background(Color(entry.configuration.ddaySymbol?[safe: 0]?.ddayBgColor ?? "ddayWhite"))
                
            case "1": // enable shadow
                HStack(spacing: 20) {
                    WidgetView_Multi03_L_Comp02_1(entry: self.entry).body
                    WidgetView_Multi03_L_Comp02_2(entry: self.entry).body
                    WidgetView_Multi03_L_Comp02_3(entry: self.entry).body
                }
                .frame(width: 400, height: 400)
                .background(Color(entry.configuration.ddaySymbol?[safe: 0]?.ddayBgColor ?? "ddayWhite"))
                
            default:
                Text("Encountered Error M03-1")
            }
            
            
             
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
