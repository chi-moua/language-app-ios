//
//  VideoChannelPickerViewController.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 7/30/22.
//

import Foundation
import UIKit
import ReSwift

class VideoChannelPickerViewController: UIViewController, StoreSubscriber {
    private let mainView: VideoChannelPickerView
    private let tableViewSource: VideoChannelDelegateDataSource
    private let searchBarDelegate: SearchBarDelegateSource
    private let store: Store<State>
    private var viewModel: VideoChannelViewModel
    
    init(store: Store<State>) {
        viewModel = .init(state: store.state.videoChannelPickerState)
        mainView = .init(with: viewModel)
        tableViewSource = .init(store: store, with: viewModel)
        searchBarDelegate = .init(
            store: store,
            editAction: VideoChannelPickerViewController.editAction,
            textChangeAction: VideoChannelPickerViewController.textChangeAction
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
        mainView.searchBar.delegate = searchBarDelegate
        subscribe()
        setUpStaticView()
    }
            
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
extension VideoChannelPickerViewController {
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

extension VideoChannelPickerViewController {
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
extension VideoChannelPickerViewController {
    enum Action: AppAction {
        case editSearch(_ isEditing: Bool)
        case search(_ text: String)
        case addChannel(row: Int)
        case viewWillDisappear
    }
}
