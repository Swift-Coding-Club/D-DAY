//
//  TimelineEntry.swift
//  D-DAYWidgetExtension
//
//  Created by Hakyung Sohn on 2023/02/26.
//

import WidgetKit
import Intents

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}
