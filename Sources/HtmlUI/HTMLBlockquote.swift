import SwiftUI

public struct HTMLBlockquote: HTML {
    var children: [HTML]
    
    init(@HTMLBuilder _ children: () -> [HTML]) {
        self.children = children()
    }
    
    func render() -> String {
        return "<blockquote>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</blockquote>"
    }
}
