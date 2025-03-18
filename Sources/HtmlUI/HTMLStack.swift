import SwiftUI

/// Pile verticale HTML simulant SwiftUI
public struct HTMLStack: HTML {
    var children: [any HTML]
    
    public init(@HTMLBuilder _ children: () -> [any HTML]) {
        self.children = children()
    }
    
    public func render() -> String {
        return "<div style='display: flex; flex-direction: column; gap: 10px;'>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</div>"
    }
}

extension String: HTML {
    public func render() -> String {
        return self
    }
}
