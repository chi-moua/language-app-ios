//
//  VideoChannelViewModel.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/2/22.
//

import Foundation

struct VideoChannelViewModel {
    var cells: [VideoSubscriptionCellModel]
    let reusableCellName: String = "channelCell"
    
    init(state: State.VideoChannelPickerState) {
        cells = state.channels
    }
}

