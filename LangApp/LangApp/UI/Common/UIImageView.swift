//
//  UIImageView.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 7/30/22.
//

import Foundation
import UIKit

extension UIImageView {
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            // always update the UI from the main thread
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }
}
