//
//  State+videoChannelPickerState.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/2/22.
//

import Foundation

extension State {
    struct VideoChannelPickerState: Equatable {
        var searchText: String = ""
        var channels: [String] = []
    }
}
