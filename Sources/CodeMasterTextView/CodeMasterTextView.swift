// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import STTextView
//import CodeEditLanguages

/// A `SwiftUI` wrapper for a ``STTextViewController``.
public struct CodeMasterTextView: NSViewControllerRepresentable {
    /// Initializes a Text Editor
    /// - Parameters:
    ///   - text: The text content
    ///   - language: The language for syntax highlighting
    ///   - theme: The theme for syntax highlighting
    ///   - font: The default font
    ///   - tabWidth: The visual tab width in number of spaces
    ///   - indentOption: The behavior to use when the tab key is pressed. Defaults to 4 spaces.
    ///   - lineHeight: The line height multiplier (e.g. `1.2`)
    ///   - wrapLines: Whether lines wrap to the width of the editor
    ///   - editorOverscroll: The percentage for overscroll, between 0-1 (default: `0.0`)
    ///   - cursorPosition: The cursor's position in the editor, measured in `(lineNum, columnNum)`
    ///   - useThemeBackground: Determines whether the editor uses the theme's background color, or a transparent
    ///                         background color
    ///   - highlightProvider: A class you provide to perform syntax highlighting. Leave this as `nil` to use the
    ///                        built-in `TreeSitterClient` highlighter.
    ///   - contentInsets: Insets to use to offset the content in the enclosing scroll view. Leave as `nil` to let the
    ///                    scroll view automatically adjust content insets.
    ///   - isEditable: A Boolean value that controls whether the text view allows the user to edit text.
    ///   - letterSpacing: The amount of space to use between letters, as a percent. Eg: `1.0` = no space, `1.5` = 1/2 a
    ///                    character's width between characters, etc. Defaults to `1.0`
    ///   - bracketPairHighlight: The type of highlight to use to highlight bracket pairs.
    ///                           See `BracketPairHighlight` for more information. Defaults to `nil`
    public init(
        _ text: Binding<String>,
        language: CodeLanguage,
        theme: EditorTheme,
        font: NSFont,
        tabWidth: Int,
        indentOption: IndentOption = .spaces(count: 4),
        lineHeight: Double,
        wrapLines: Bool,
        editorOverscroll: Double = 0.0,
        cursorPosition: Binding<(Int, Int)>,
        useThemeBackground: Bool = true,
        highlightProvider: HighlightProviding? = nil,
        contentInsets: NSEdgeInsets? = nil,
        isEditable: Bool = true,
        letterSpacing: Double = 1.0,
        bracketPairHighlight: BracketPairHighlight? = nil
    ) {
        self._text = text
        self.language = language
        self.theme = theme
        self.useThemeBackground = useThemeBackground
        self.font = font
        self.tabWidth = tabWidth
        self.indentOption = indentOption
        self.lineHeight = lineHeight
        self.wrapLines = wrapLines
        self.editorOverscroll = editorOverscroll
        self._cursorPosition = cursorPosition
        self.highlightProvider = highlightProvider
        self.contentInsets = contentInsets
        self.isEditable = isEditable
        self.letterSpacing = letterSpacing
        self.bracketPairHighlight = bracketPairHighlight
    }
    
    @Binding private var text: String
    private var language: CodeLanguage
    private var theme: EditorTheme
    private var font: NSFont
    private var tabWidth: Int
    private var indentOption: IndentOption
    private var lineHeight: Double
    private var wrapLines: Bool
    private var editorOverscroll: Double
    @Binding private var cursorPosition: (Int, Int)
    private var useThemeBackground: Bool
    private var highlightProvider: HighlightProviding?
    private var contentInsets: NSEdgeInsets?
    private var isEditable: Bool
    private var letterSpacing: Double
    private var bracketPairHighlight: BracketPairHighlight?
    
    public typealias NSViewControllerType = STTextViewController
    
    
}
