//
//  VideoChannelDelegateDataSource.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/4/22.
//

import Foundation
import UIKit
import ReSwift

class VideoChannelDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    typealias Action = VideoChannelPickerViewController.Action
    
    var viewModel: VideoChannelViewModel
    
    init(
        store: Store<State>,
        with viewModel: VideoChannelViewModel
    ) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reusableCellName, for: indexPath) as? VideoSubscriptionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(model: viewModel.cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        store.dispatch(Action.addChannel(row: indexPath.row))
    }
    
    
}
