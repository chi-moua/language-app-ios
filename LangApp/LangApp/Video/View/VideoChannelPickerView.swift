//
//  VideoChannelPickerView.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/4/22.
//

import UIKit

class VideoChannelPickerView: UIView {
    let vStackView: UIStackView = .init()
    let tableView: UITableView = .init()
    let searchBar: UISearchBar = .init()
    let viewModel: VideoChannelViewModel
    
    init(with viewModel: VideoChannelViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubViews() {
        setUpStackView()
    }
    
    private func setUpStackView() {
        vStackView.alignment = .fill
        vStackView.axis = .vertical
        vStackView.spacing = 12.0
        
        [tableView, searchBar].forEach {
            vStackView.addArrangedSubview($0)
        }
    }
    
    private func setUpTableView() {
        tableView.register(VideoSubscriptionTableViewCell.self, forCellReuseIdentifier: viewModel.reusableCellName)
    }
}
