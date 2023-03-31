//
//  WidgetView_Multi02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/08.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi02EntryView : View { // hex done
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
                Text("Encountered Error M02-1")
            }
            
        @unknown default:
            Text("Sorry, You have encountered Default Error. M02-2")
        }
    }
}

// Multi Medium03, Large01
struct WidgetView_Multi02: Widget {
    let kind: String = "WidgetView_Multi02"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi02EntryView(entry: entry)
        }
        .configurationDisplayName(LocalizedStringKey("#2 멀티 위젯"))
        .description(LocalizedStringKey("여러 개의 디데이를 표시할 수 있는 위젯입니다."))
        .supportedFamilies([.systemMedium])
    }
}

struct WidgetView_Multi02_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi02EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
