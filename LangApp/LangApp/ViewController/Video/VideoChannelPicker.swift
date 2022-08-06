//
//  VideoChannelPicker.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 7/30/22.
//

import Foundation
import UIKit
import ReSwift

class VideoChannelPicker: UIViewController, UISearchBarDelegate, StoreSubscriber {
    private let mainView: VideoChannelPickerView
    private let tableViewSource: VideoChannelDelegateDataSource
    private let searchBarDelegate: SearchBarDelegateSource
    private let store: Store<State>
    private var viewModel: VideoChannelViewModel
    
    init(store: Store<State>) {
        viewModel = .init(state: store.state.videoChannelPickerState)
        mainView = .init(cellName: viewModel.reusableCellName)
        tableViewSource = .init(store: store, viewModel: viewModel)
        searchBarDelegate = .init(
            store: store,
            editAction: VideoChannelPicker.editAction,
            textChangeAction: VideoChannelPicker.textChangeAction
        )
        self.store = store
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.dataSource = tableViewSource
        mainView.tableView.delegate = tableViewSource
        mainView.searchBar.delegate = self
        subscribe()
        setUpStaticView()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.videoChannelPickerState
            }.skipRepeats()
        }
    }
    
}

// MARK: - View Setup
extension VideoChannelPicker {
    func setUpStaticView() {
        view = mainView
    }
    
    func newState(state: State.VideoChannelPickerState) {
        if state.filteredChannels != viewModel.cells {
            viewModel.cells = state.filteredChannels
            mainView.tableView.reloadData()
        }
    }
}

extension VideoChannelPicker {
    static var editAction: (Bool) -> Action {
        { (val) -> Action in
            return Action.editSearch(val)
        }
    }
    
    static var textChangeAction: (String) -> Action {
        { (val) -> Action in
            return Action.search(val)
        }
    }
}

// MARK: - Actions
extension VideoChannelPicker {
    enum Action: AppAction {
        case editSearch(_ isEditing: Bool)
        case search(_ text: String)
        case addChannel(row: Int)
    }
}
