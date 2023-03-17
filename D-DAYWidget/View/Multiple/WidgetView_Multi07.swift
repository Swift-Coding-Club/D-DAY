//
//  WidgetView_Multi07.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi07EntryView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
        case .systemExtraLarge:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Multi07_XL_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Multi07_XL_Comp01(entry: self.entry).body
                
            default:
                Text("Encountered Error M07-1")
            }
            
        @unknown default:
            Text("Sorry, You have encountered Default Error.")
        }
    }
}

// Multi ExtraLarge02
struct WidgetView_Multi07: Widget {
    let kind: String = "WidgetView_Multi07"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi07EntryView(entry: entry)
        }
        .configurationDisplayName("#3 iPad 전용 위젯")
        .description("여러개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemExtraLarge])
    }
}

struct WidgetView_Multi07_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi07EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    }
}
