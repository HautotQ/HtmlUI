import SwiftUI

struct HTMLUl: HTML {
    var children: [HTML]
    
    init(@HTMLBuilder _ children: () -> [HTML]) {
        self.children = children()
    }
    
    func render() -> String {
        return "<ul>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</ul>"
    }
}
