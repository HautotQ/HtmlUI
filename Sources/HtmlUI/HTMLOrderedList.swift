import SwiftUI

public struct HTMLOrderedList: HTML {
    var children: [HTML]
    
    public init(@HTMLBuilderArray _ children: () -> [HTML]) {
        self.children = children()
    }
    
    public func render() -> String {
        return "<ol>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</ol>"
    }
}
