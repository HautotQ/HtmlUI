import SwiftUI

/// Élément de balise `<meta>` HTML
public struct HTMLMeta: HTML {
    let name: String
    let content: String

    public init(name: String, content: String) {
        self.name = name
        self.content = content
    }

    public func render() -> String {
        return "<meta name=\"\(name)\" content=\"\(content)\">"
    }
}
