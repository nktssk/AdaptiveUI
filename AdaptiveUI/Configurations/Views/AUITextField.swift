//
//  AUITextField.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

public final class AUITextField: AUIView {

    // MARK: Nested Types

    public enum Alignment: String, Codable {
        case left
        case center
        case right
    }

    public enum CleanButtonMode: String, Codable {
        case never
        case whileEditing
        case unlessEditing
        case always
    }

    public enum BorderStyle: String, Codable {
        case none
        case line
        case bezel
        case roundedRect
    }

    public enum AutocapitalizationType: String, Codable {
        case none
        case words
        case sentences
        case allCharacters
    }

    public enum AutocorrectionType: String, Codable {
        case `default`
        case no
        case yes
    }

    public enum SpellCheckingType: String, Codable {
        case `default`
        case no
        case yes
    }

    public enum KeyboardType: String, Codable {
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

    public enum KeyboardAppearance: String, Codable {
        case `default`
        case dark
        case light
    }

    // MARK: Configuration

    @Convertible(default: AUIText())
    public var text: AUIText

    @Convertible
    public var placeholder: String?

    // MARK: Representation

    @Convertible(default: .defaultTextColor)
    public var textColor: AUIColor

    @Convertible(default: .never)
    public var cleanButtonMode: CleanButtonMode

    @Convertible(default: .roundedRect)
    public var borderStyle: BorderStyle

    @Convertible(default: .sentences)
    public var autocapitalizationType: AutocapitalizationType

    @Convertible(default: .default)
    public var autocorrectionType: AutocorrectionType

    @Convertible(default: .default)
    public var spellCheckingType: SpellCheckingType

    @Convertible(default: .default)
    public var keyboardType: KeyboardType

    // MARK: Layout

    @Convertible(default: .left)
    public var textAlignment: Alignment
}
