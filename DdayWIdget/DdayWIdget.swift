//
//  DdayWIdget.swift
//  DdayWIdget
//
//  Created by MinJi Kang on 2023/02/14.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
//    @AppStorage(KeyForUserDefaults, store: UserDefaults(suiteName: "group.dday.ddayApp")) var emailAddress: String = "sample@email.com"

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        
        completion(entry)
    }

    // Timeline은 TimelienEntry(Date)의 배열
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 100 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// 위젯이 업데이트 되는 주기(Date) - 위젯에 있는 cell이 수정될 때마다? & 하루가 지나고 D-(n)이 D-(n-1)이 될 때마다
struct SimpleEntry: TimelineEntry {
    let date: Date // 업데이트 될 시간 정보
    let configuration: ConfigurationIntent
}

struct DdayWIdgetEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry

    var testArr = UserDefaults(suiteName: "group.dday.ddayApp")!.getDdayInfo()
   
    var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }()
    
    func dateFormatToString(from value: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        return dateFormatter.string(from: value)
    }
    
    func calculateDday(storedDate: Date) -> Int {
        let targetDateString = dateFormatToString(from: storedDate)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let formattedTargetDate = dateFormatter.date(from: targetDateString)!

        // 현재시간 (formattedCurrentDate)
        let currentDateString = dateFormatToString(from: Date())
        let formattedCurrentDate = dateFormatter.date(from: currentDateString)!

        let timeInterval = Calendar.current.dateComponents([.day], from: formattedTargetDate, to: formattedCurrentDate)
            
        return timeInterval.day!
    }
    
    func DdayFormat(dateToCalculate: Int) -> String {
        var d: String = ""
        if dateToCalculate > 0 {
            d = "D+" + String(dateToCalculate)

        } else if dateToCalculate == 0 {
            d = " D-DAY! "

        } else {
            d = "D" + String(dateToCalculate)

        }
        
        return d
    }
    
//    var testDdayInfo = testArr.map{DdayInfo.self, from: $0}
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text(testArr[0].title)
                .font(.headline)
            Text(testArr[0].subTitle)
            Text(testArr[0].date, formatter: formatter)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(DdayFormat(dateToCalculate: calculateDday(storedDate: testArr[0].date)))
        case .systemMedium:
            Text(testArr[1].title)
                .font(.headline)
            Text(testArr[1].subTitle)
            Text(testArr[1].date, formatter: formatter)
                .font(.subheadline)
                .foregroundColor(.gray)

        case .systemLarge:
            Text(testArr[2].title)
                .font(.headline)
            Text(testArr[2].subTitle)
            Text(testArr[2].date, formatter: formatter)
                .font(.subheadline)
                .foregroundColor(.gray)

        @unknown default:
            Text("unknown")
        }
    }
}

@main
struct DdayWIdget: Widget {
    let kind: String = "DdayWIdget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DdayWIdgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

// 위젯 추가 화면에서 보여지는 미리보기 위젯
struct DdayWIdget_Previews: PreviewProvider {
    static var previews: some View {
        DdayWIdgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
