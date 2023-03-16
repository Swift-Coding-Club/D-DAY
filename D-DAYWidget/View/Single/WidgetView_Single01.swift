//
//  WidgetView.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import SwiftUI
import WidgetKit

struct WidgetView_Single01EntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        switch self.family {
        case .systemSmall:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Single01_S_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Single01_S_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error S01-1")
            }
            
        case .systemMedium:
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0": // disable shadow
                WidgetView_Single01_M_Comp01(entry: self.entry).body
                
            case "1": // enable shadow
                WidgetView_Single01_M_Comp02(entry: self.entry).body
                
            default:
                Text("Encountered Error S01-2")
            }
            
        @unknown default:
            Text("Encountered Error S01-3")
        }
    }
}

// Single Small01, Medium01
struct WidgetView_Single01: Widget {
    let kind: String = "WidgetView_Single01"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Single01EntryView(entry: entry)
        }
        .configurationDisplayName("#1 심플 위젯")
        .description("한 개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct WidgetView_Single01_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Single01EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct WidgetView_Single01_Previews2: PreviewProvider {
    static var previews: some View {
        WidgetView_Single01EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

extension Array {
    subscript (safe index: Int) -> Element? {
        // iOS 9 or later
        return indices ~= index ? self[index] : nil
        // iOS 8 or earlier
        // return startIndex <= index && index < endIndex ? self[index] : nil
        // return 0 <= index && index < self.count ? self[index] : nil
    }
}
