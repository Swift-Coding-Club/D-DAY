//
//  WidgetView_Multi02.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi04EntryView : View { // hex done
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
            
        case .systemLarge:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Multi04_L_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Multi04_L_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error M04-1")
            }
            
        @unknown default:
            Text("Sorry, You have encountered Default Error. M04-2")
        }
    }
}

// Multi Large02
struct WidgetView_Multi04: Widget {
    let kind: String = "WidgetView_Multi04"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi04EntryView(entry: entry)
        }
        .configurationDisplayName(LocalizedStringKey("#2 멀티 위젯"))
        .description(LocalizedStringKey("여러 개의 디데이를 표시할 수 있는 위젯입니다."))
        .supportedFamilies([.systemLarge])
    }
}

struct WidgetView_Multi04_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi04EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
