//
//  WidgetView_Multi08.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/03/16.
//

import SwiftUI
import WidgetKit

struct WidgetView_Multi08EntryView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        
        switch self.family {
        case .systemExtraLarge:
            
            let ddaySymbolMenu: [DdaySymbol] = DefaultArrForWidget_M08().getDaySymbolMenu(entry: self.entry)
            
            switch entry.configuration.shadow?.stringValue ?? "0" {
            case "0":  // disable shadow
                ZStack{
                    WidgetView_Multi08_XL_Comp01_1(entry: self.entry, ddaySymbolMenu: ddaySymbolMenu).body
                    WidgetView_Multi08_XL_Comp01_2(entry: self.entry, ddaySymbolMenu: ddaySymbolMenu).body
                }
                .frame(height: 450)
                .background(Color("ddayBlack"))
            
            case "1": // enable shadow
                ZStack{
                    WidgetView_Multi08_XL_Comp02_1(entry: self.entry, ddaySymbolMenu: ddaySymbolMenu).body
                    WidgetView_Multi08_XL_Comp02_2(entry: self.entry, ddaySymbolMenu: ddaySymbolMenu).body
                }
                .frame(height: 450)
                .background(Color("ddayBlack"))
                
            default:
                Text("Encountered Error M08-1")
            }
            
        @unknown default:
            Text("Sorry, You have encountered Default Error. M08-2")
        }
    }
}

// Multi ExtraLarge03
struct WidgetView_Multi08: Widget {
    let kind: String = "WidgetView_Multi08"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetView_Multi08EntryView(entry: entry)
        }
        .configurationDisplayName("#3 iPad 전용 위젯")
        .description("여러개의 디데이를 표시할 수 있는 위젯입니다.")
        .supportedFamilies([.systemExtraLarge])
    }
}

struct WidgetView_Multi08_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView_Multi08EntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
    }
}
