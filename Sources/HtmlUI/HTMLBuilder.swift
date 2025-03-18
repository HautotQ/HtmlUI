import SwiftUI

/// **HTMLBuilder** : Permet d'écrire plusieurs éléments HTML dans une closure
@resultBuilder
public struct HTMLBuilder {
    public static func buildPartialBlock(first: HTML) -> HTML {
        first
    }
    
    public static func buildPartialBlock(accumulated: HTML, next: HTML) -> HTML {
        HTMLStack {
            accumulated
            next
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
