//
//  VideoChannelPicker.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 7/30/22.
//

import Foundation
import UIKit
import ReSwift

class VideoChannelPicker:
    UIViewController,
    UITableViewDelegate,
    UITableViewDataSource,
    SearchBarDelegate,
    StoreSubscriber
{
    let vStackView: UIStackView!
    let tableView: UITableView!
    let searchBar: SearchBarTextField!
    
    private let store: Store<State>
    private var viewModel: VideoChannelViewModel
    
    init(store: Store<State>) {
        vStackView = .init()
        tableView = .init()
        searchBar = .init()
        viewModel = .init(state: store.state.videoChannelPickerState)
        
        self.store = store
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
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
    private func setUpStaticView() {
        searchBar.setUp(
            keyboardType: .asciiCapable
        )
        
        setUpStackView()
        registerCell()
        
        // main view
        view.addSubview(vStackView)
    }
    
    private func setUpStackView() {
        vStackView.alignment = .fill
        vStackView.axis = .vertical
        vStackView.spacing = 12.0
        
        [tableView, searchBar].forEach {
            vStackView.addArrangedSubview($0)
        }
    }
    
    func newState(state: State.VideoChannelPickerState) {
        viewModel.setUp(channels: state.channels)
        tableView.reloadData()
    }
}

// MARK: - TableView
extension VideoChannelPicker {
    private func registerCell() {
        tableView.register(VideoSubscriptionTableViewCell.self, forCellReuseIdentifier: "channelCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? VideoSubscriptionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(model: viewModel.cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        store.dispatch(Action.addChannel(row: indexPath.row))
    }
}

// MARK: - TextField
extension VideoChannelPicker {
    func textFieldDidChange(_ textFieldViewController: SearchBarTextField, text: String?) {
        store.dispatch(Action.updateSearch(text: text ?? ""))
    }
}

// MARK: - Actions
extension VideoChannelPicker {
    enum Action: AppAction {
        case updateSearch(text: String)
        case addChannel(row: Int)
    }
}
