//
//  State+videoChannelPickerState.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/2/22.
//

import Foundation

extension State {
    struct VideoChannelPickerState: Equatable {
        var searchText: TextFieldState = .init()
        var channels: [VideoSubscriptionCellModel] = []
        var filteredChannels: [VideoSubscriptionCellModel] = []
    }
}
