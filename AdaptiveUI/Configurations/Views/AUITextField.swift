//
//  AUITextField.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

final class AUITextField: AUIView {

    // MARK: Nested Types

    enum Alignment: String, Codable {
        case left
        case center
        case right
    }

    enum CleanButtonMode: String, Codable {
        case never
        case whileEditing
        case unlessEditing
        case always
    }

    enum BorderStyle: String, Codable {
        case none
        case line
        case bezel
        case roundedRect
    }

    enum AutocapitalizationType: String, Codable {
        case none
        case words
        case sentences
        case allCharacters
    }

    enum AutocorrectionType: String, Codable {
        case `default`
        case no
        case yes
    }

    enum SpellCheckingType: String, Codable {
        case `default`
        case no
        case yes
    }

    enum KeyboardType: String, Codable {
        case `default`
        case asciiCapable
        case numbersAndPunctuation
        case URL
        case numberPad
        case phonePad
        case namePhonePad
        case emailAddress
        case decimalPad
        case twitter
        case webSearch
        case asciiCapableNumberPad
    }

    enum KeyboardAppearance: String, Codable {
        case `default`
        case dark
        case light
    }

    // MARK: Configuration

    @Convertible
    var text: AUIText

    @Convertible
    var placeholder: String?

    // MARK: Representation

    @Convertible(default: .defaultTextColor)
    var textColor: AUIColor

    @Convertible(default: .never)
    var cleanButtonMode: CleanButtonMode

    @Convertible(default: .roundedRect)
    var borderStyle: BorderStyle

    @Convertible(default: .sentences)
    var autocapitalizationType: AutocapitalizationType

    @Convertible(default: .default)
    var autocorrectionType: AutocorrectionType

    @Convertible(default: .default)
    var spellCheckingType: SpellCheckingType

    @Convertible(default: .default)
    var keyboardType: KeyboardType

    // MARK: Layout

    @Convertible(default: .left)
    var textAlignment: Alignment
}
