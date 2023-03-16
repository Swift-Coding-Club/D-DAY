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
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Multi01_M_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Multi01_M_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error M01-1")
            }
            
        @unknown default:
            Text("Sorry, You have encountered Default Error. M01-2")
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
        .configurationDisplayName("#2 다중 위젯")
        .description("여러개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemMedium])
    }
}

struct WidgetView_Multi01_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi01EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
