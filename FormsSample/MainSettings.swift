//
//  MainSettings.swift
//  FormsSample
//
//  Created by Chris Eidhof on 22.03.18.
//  Copyright © 2018 objc.io. All rights reserved.
//

import UIKit

struct MainSettings {
    var hotspot = Hotspot()
    
    var hotspotEnabled: String {
        return hotspot.isEnabled ? "On" : "Off"
    }
}

let settingsForm: Form<MainSettings> =
    sections([
        section([
            detailTextCell(title: "Personal Hotspot", keyPath: \MainSettings.hotspotEnabled, form: bind(form: hotspotForm, to: \.hotspot))
        ])
    ])

