//
//  D_DAYWidgetBundle.swift
//  D-DAYWidget
//
//  Created by MinJi Kang on 2023/02/26.
//

import WidgetKit
import SwiftUI

@main
struct D_DAYWidgetBundle: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        WidgetView_Single01()
        WidgetView_Single02()
        
        WidgetView_Multi02()
        WidgetView_Multi01()
        WidgetView_Multi03()
        WidgetView_Multi04()
        WidgetView_Multi05()
        WidgetView_Multi06()
        WidgetView_Multi07()
        WidgetView_Multi08()
    }
}
