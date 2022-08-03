//
//  UI+Image.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/20/22.
//

import Foundation
import UIKit

struct UI {
    enum Image: String, CaseIterable {
        case headphoneIcon
        case microphoneIcon
        case newspaperIcon
        case tvIcon
        
        var image: UIImage {
            let image = UIImage(named: rawValue)
            return image!
        }
    }
}
