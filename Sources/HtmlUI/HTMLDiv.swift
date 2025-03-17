import SwiftUI

/// **HTMLDiv** : Division HTML avec classe CSS
struct HTMLDiv: HTML {
    var className: String?
    var children: [HTML]
    
    init(className: String? = nil, @HTMLBuilder _ children: () -> [HTML]) {
        self.className = className
        self.children = children()
    }
    
    func render() -> String {
        let classAttr = className != nil ? " class='\(className!)'" : ""
        return "<div\(classAttr)>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</div>"
    }
}
