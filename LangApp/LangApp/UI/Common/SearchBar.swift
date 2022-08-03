//
//  SearchBar.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 7/31/22.
//

import Foundation
import UIKit

protocol SearchBarDelegate: AnyObject {
    func textFieldDidChange(_ textFieldViewController: SearchBarTextField, text: String?) -> Void
}

extension SearchBarDelegate {
    func textFieldDidChange(_ textFieldViewController: SearchBarTextField, text: String?) {}
}

class SearchBarTextField: UIView, UITextFieldDelegate {

    let textField: UITextField
    let leftImage: UIImageView
    
    weak var delegate: SearchBarDelegate?
    
    private var characterSet: CharacterSet?
    private var maxCharacterCount: Int?
            
    init() {
        textField = UITextField()
        leftImage = UIImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(
        keyboardType: UIKeyboardType,
        characterSet: CharacterSet? = nil,
        maxCharacterCount: Int? = nil
    ) {
        self.characterSet = characterSet
        self.maxCharacterCount = maxCharacterCount
        
        setUpTextField()
        setUpImage()
        setUpKeyboard(type: keyboardType)
        setUpImage()
        
        updateStyle()
    }
    
    private func setUpTextField() {
        textField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    private func setUpImage() {
        leftImage.image = UI.Image.tvIcon.image
        textField.leftView = leftImage
        textField.leftViewMode = .always
    }
    
    private func setUpKeyboard(type: UIKeyboardType) {
        textField.keyboardType = type
    }
    
    func updateStyle() {
        textField.borderStyle = .line
        textField.layer.borderWidth = 3.0
        textField.layer.borderColor = UIColor.gray.cgColor
    }
}

extension SearchBarTextField {
    @objc func textFieldChange() {
        delegate?.textFieldDidChange(self, text: textField.text)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            return true
        }
        
        if let allowedCharacters = characterSet {
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        if let maxLength = maxCharacterCount {
            let currentText = (textField.text ?? "") as NSString
            let updatedText = currentText.replacingCharacters(in: range, with: string)
            return updatedText.count <= maxLength
        }
        
        return true
    }
}
