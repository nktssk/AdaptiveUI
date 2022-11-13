//
//  UIKit.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//


import UIKit

extension AUILabel.Alignment {
    var uiAligment: NSTextAlignment {
        switch self {
        case .center:
            return .center
        case .left:
            return .left
        case .right:
            return .right
        }
    }
}

extension AUITextView.Alignment {
    var uiAligment: NSTextAlignment {
        switch self {
        case .center:
            return .center
        case .left:
            return .left
        case .right:
            return .right
        }
    }
}

extension AUIOffset {
    var cgSize: CGSize {
        CGSize(width: x, height: y)
    }
}

extension AUIText {
    var uiFont: UIFont {
        let weight: UIFont.Weight
        switch fontWeight {
        case .light:
            weight = .light
        case .medium:
            weight = .medium
        case .regular:
            weight = .regular
        case .bold:
            weight = .bold
        }

        return .systemFont(ofSize: CGFloat(fontSize), weight: weight)
    }
}

extension AUIImageView.ContentMode {
    var uiKit: UIImageView.ContentMode {
        switch self {
        case .scaleToFill: return .scaleToFill
        case .scaleAspectFit: return .scaleAspectFit
        case .scaleAspectFill: return .scaleAspectFill
        case .center: return .center
        case .top: return .top
        case .bottom: return .bottom
        case .left: return .left
        case .right: return .right
        case .topLeft: return .topLeft
        case .topRight: return .topRight
        case .bottomLeft: return .bottomLeft
        case .bottomRight:  return .bottomRight
        }
    }
}

extension AUIInsets {
    var uiKit: UIEdgeInsets {
        UIEdgeInsets(top: top, left: `left`, bottom: bottom, right: `right`)
    }
}

extension AUITextField.Alignment {
    var uiKit: NSTextAlignment {
        switch self {
        case .center:
            return .center
        case .left:
            return .left
        case .right:
            return .right
        }
    }
}

extension AUITextField.CleanButtonMode {
    var uiKit: UITextField.ViewMode {
        switch self {
        case .never:
            return .never
        case .whileEditing:
            return .whileEditing
        case .unlessEditing:
            return .unlessEditing
        case .always:
            return .always
        }
    }
}

extension AUITextField.BorderStyle {
    var uiKit: UITextField.BorderStyle {
        switch self {
        case .none:
            return .none
        case .line:
            return .line
        case .bezel:
            return .bezel
        case .roundedRect:
            return .roundedRect
        }
    }
}

extension AUITextField.AutocapitalizationType {
    var uiKit: UITextAutocapitalizationType {
        switch self {
        case .none:
            return .none
        case .words:
            return .words
        case .sentences:
            return .sentences
        case .allCharacters:
            return .allCharacters
        }
    }
}

extension AUITextField.AutocorrectionType {
    var uiKit: UITextAutocorrectionType {
        switch self {
        case .default:
            return .default
        case .no:
            return .no
        case .yes:
            return .yes
        }
    }
}

extension AUITextField.SpellCheckingType {
    var uiKit: UITextSpellCheckingType {
        switch self {
        case .default:
            return .default
        case .no:
            return .no
        case .yes:
            return .yes
        }
    }
}

extension AUITextField.KeyboardType {
    var uiKit: UIKeyboardType {
        switch self {
        case .`default`:
            return .default
        case .asciiCapable:
            return .asciiCapable
        case .numbersAndPunctuation:
            return .numbersAndPunctuation
        case .`URL`:
            return .URL
        case .numberPad:
            return .numberPad
        case .phonePad:
            return .phonePad
        case .namePhonePad:
            return .namePhonePad
        case .emailAddress:
            return .emailAddress
        case .decimalPad:
            return .decimalPad
        case .twitter:
            return .twitter
        case .webSearch:
            return .webSearch
        case .asciiCapableNumberPad:
            return .asciiCapableNumberPad
        }
    }
}
