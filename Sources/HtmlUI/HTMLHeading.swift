import SwiftUI

public struct HTMLHeading: HTML {
    var level: Int
    var children: [HTML]
    
    init(level: Int, @HTMLBuilder _ children: () -> [HTML]) {
        self.level = level
        self.children = children()
    }
    
    public func render() -> String {
        return "<h\(level)>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</h\(level)>"
    }
}
