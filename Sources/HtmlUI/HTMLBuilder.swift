import SwiftUI

/// **HTMLBuilder** : Permet d'écrire plusieurs éléments HTML dans une closure
@resultBuilder
public struct HTMLBuilder {
    static func buildBlock(_ components: any HTML...) -> [any HTML] {
        return components
    }
}

/// **CSSBuilder** : Permet d'écrire plusieurs styles CSS en closure
@resultBuilder
public struct CSSBuilder {
    static func buildBlock(_ components: String...) -> [String] {
        return components
    }
}

@resultBuilder
public struct StyleBuilder {
    static func buildBlock(_ components: HTML...) -> [HTML] {
        return components
    }
}
