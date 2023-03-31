//
//  WidgetView_Multi06.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi06EntryView: View { // hex done
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
        case .systemExtraLarge:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Multi06_XL_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Multi06_XL_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error M06-1")
            }
            
        @unknown default:
            Text("Sorry, You have encountered Default Error. M06-2")
        }
    }
}

// Multi ExtraLarge01
struct WidgetView_Multi06: Widget {
    let kind: String = "WidgetView_Multi06"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi06EntryView(entry: entry)
        }
        .configurationDisplayName("#3 iPad 전용 위젯")
        .description("여러 개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemExtraLarge])
    }
}

struct WidgetView_Multi06_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi06EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    }
}
