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
        WidgetView_Single01() // ook
        WidgetView_Single02() // ook
        
        WidgetView_Multi01() // ok
        WidgetView_Multi02() // ok
        WidgetView_Multi03() // ok
        WidgetView_Multi04() // ok
        WidgetView_Multi05() // ok
        WidgetView_Multi06() // ok
        WidgetView_Multi07() // ok
        WidgetView_Multi08() // ook
    }
}
