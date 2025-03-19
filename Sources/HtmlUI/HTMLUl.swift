import SwiftUI

public struct HTMLUl: HTML {
    var children: [HTML]
    
    public init(@HTMLBuilderArray _ children: () -> [HTML]) {
        self.children = children()
    }
    
    public func render() -> String {
        return "<ul>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</ul>"
    }
}
