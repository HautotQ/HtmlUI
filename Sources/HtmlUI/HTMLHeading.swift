import SwiftUI

struct HTMLHeading: HTML {
    var level: Int
    var children: [HTML]
    
    init(level: Int, @HTMLBuilder _ children: () -> [HTML]) {
        self.level = level
        self.children = children()
    }
    
    func render() -> String {
        return "<h\(level)>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</h\(level)>"
    }
}
