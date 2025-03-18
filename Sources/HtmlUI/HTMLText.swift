import SwiftUI

/// Élément de texte HTML
public struct HTMLText: HTML {
    let content: String
    
    init(_ content: String) {
        self.content = content
    }
    
    public func render() -> String {
        return "<p>\(content)</p>"
    }
}
