import SwiftUI

public struct HTMLListItem: HTML {
    var children: [HTML]
    
    public init(@HTMLBuilderArray _ children: () -> [HTML]) {
        self.children = children()
    }
    
    public func render() -> String {
        return "<li>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</li>"
    }
}
