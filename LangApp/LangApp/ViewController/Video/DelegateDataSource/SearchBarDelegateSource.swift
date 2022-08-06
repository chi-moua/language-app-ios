//
//  SearchBarDelegateSource.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/4/22.
//

import Foundation
import UIKit
import ReSwift

class SearchBarDelegateSource: NSObject, UISearchBarDelegate {
    let store: Store<State>
    let editAction: (Bool) -> AppAction
    let textChangeAction: (String) -> AppAction
    
    init(
        store: Store<State>,
        editAction: @escaping (Bool) -> AppAction,
        textChangeAction: @escaping (String) -> AppAction
    ) {
        self.store = store
        self.editAction = editAction
        self.textChangeAction = textChangeAction
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        store.dispatch(editAction(true))
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        store.dispatch(editAction(false))
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        store.dispatch(editAction(false))
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        store.dispatch(editAction(false))
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        store.dispatch(textChangeAction(searchText))
    }
}
