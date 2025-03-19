import SwiftUI

public struct HTMLBlockquote: HTML {
    var children: [HTML]
    
    public init(@HTMLBuilderArray _ children: () -> [HTML]) {
        self.children = children()
    }
    
    public func render() -> String {
        return "<blockquote>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</blockquote>"
    }
}
