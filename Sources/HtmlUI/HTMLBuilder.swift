import SwiftUI

/// **HTMLBuilder** : Permet d'écrire plusieurs éléments HTML dans une closure
@resultBuilder
struct HTMLBuilder {
    static func buildBlock(_ components: any HTML...) -> any HTML {
        return HTMLStack {
            for component in components {
                component
            }
        }
    }
}

/// **CSSBuilder** : Permet d'écrire plusieurs styles CSS en closure
@resultBuilder
struct CSSBuilder {
    static func buildBlock(_ components: String...) -> [String] {
        return components
    }
}

@resultBuilder
struct StyleBuilder {
    static func buildBlock(_ components: HTML...) -> [HTML] {
        return components
    }
}
