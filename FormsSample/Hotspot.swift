//  Copyright © 2018 objc.io. All rights reserved.

import Foundation


struct Hotspot {
    var isEnabled: Bool = true
    var password: String = "hello"
    var networkName: String = "my network"
    var showPreview: ShowPreview = .always
}


extension Hotspot {
    var enabledSectionTitle: String? {
        return isEnabled ? "Personal Hotspot Enabled" : nil
    }
}

let hotspotForm: Form<Hotspot> =
    sections([
        section([
            controlCell(title: "Personal Hotspot", control: uiSwitch(keyPath: \.isEnabled))
            ], footer: \.enabledSectionTitle),
        section([
            detailTextCell(title: "Show Preview", keyPath: \.showPreview.text, form: showPreviewForm)
            ]),
        section([
            nestedTextField(title: "Password", keyPath: \.password),
            nestedTextField(title: "Network Name", keyPath: \.networkName)
            ])
        ])


enum ShowPreview {
    case always
    case never
    case whenUnlocked
    
    static let all: [ShowPreview] = [.always, .whenUnlocked, .never]
    
    var text: String {
        switch self {
        case .always: return "Always"
        case .whenUnlocked: return "When Unlocked"
        case .never: return "Never"
        }
    }
}

let showPreviewForm: Form<Hotspot> =
    sections([
        section(
            ShowPreview.all.map { option in
                optionCell(title: option.text, option: option, keyPath: \.showPreview)
            }
        )
    ])
