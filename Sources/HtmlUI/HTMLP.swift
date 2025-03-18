import SwiftUI

public struct HTMLP: HTML {
    var children: [HTML]
    
    init(@HTMLBuilder _ children: () -> [HTML]) {
        self.children = children()
    }
    
    public func render() -> String {
        return "<p>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</p>"
    }
}
