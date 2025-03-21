import SwiftUI

public struct HTMLFooter: HTML {
    var className: String?
    var children: [HTML]
    
    public init(className: String? = nil, @StyleBuilder _ children: () -> [HTML]) {
        self.className = className
        self.children = children()
    }
    
    public func render() -> String {
        let classAttr = className != nil ? " class='\(className!)'" : ""
        return "<footer\(classAttr)>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</footer>"
    }
}
