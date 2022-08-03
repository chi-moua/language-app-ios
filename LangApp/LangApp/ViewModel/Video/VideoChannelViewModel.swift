//
//  VideoChannelViewModel.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/2/22.
//

import Foundation

struct VideoChannelViewModel {
    var cells: [VideoSubscriptionCellModel]
    
    init(state: State.VideoChannelPickerState) {
        setUp(channels: state.channels)
    }
    
    mutating func setUp(channels: [String]) {
        cells = channels.map {
            VideoSubscriptionCellModel(
                imageURL: "test",
                channelTitle: $0
            )
        }
    }
}
