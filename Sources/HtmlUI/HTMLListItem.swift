import SwiftUI

public struct HTMLListItem: HTML {
    var children: [HTML]
    
    init(@HTMLBuilder _ children: () -> [HTML]) {
        self.children = children()
    }
    
    func render() -> String {
        return "<li>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</li>"
    }
}
