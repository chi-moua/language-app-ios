//
//  AppReducer+videoChannelPickerReducer.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/3/22.
//

import Foundation

extension AppReducer {
    static func interactorReducer(action: VideoChannelPicker.Action, state: State) -> State {
        var state = state
        
        switch action {
        case let .addChannel(row):
            let selectedChannel = state.videoChannelPickerState.filteredChannels[row]
            state.videoChannelPickerState.selectedChannels.append(selectedChannel)
            
        case let .editSearch(isEditing):
            state.videoChannelPickerState.searchText.isFocus = isEditing
            
        case let .search(query):
            state.videoChannelPickerState.searchText.text = query
            state.videoChannelPickerState.filterChannels()
            
        case .viewWillDisappear:
            //make network call to save selected channels
            return state
        }
        
        return state
    }
}

extension State.VideoChannelPickerState {
    mutating func filterChannels() {
        // Filtering should happen when the user editing is completed
        if searchText.isFocus {
           return
        }
        
        // All channels should appear with an empty query
        if searchText.text.isEmpty {
            filteredChannels = channels
        }
        
        filteredChannels = channels.filter {
            $0.channelTitle.hasPrefix(searchText.text)
        }
    }
}
