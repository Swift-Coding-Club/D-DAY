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
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Single02_M_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Single02_M_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error S02-1")
            }
            
        case .systemLarge:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Single02_L_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Single02_L_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error S04-1")
            }
            
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
