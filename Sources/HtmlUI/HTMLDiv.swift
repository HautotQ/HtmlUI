import SwiftUI

/// **HTMLDiv** : Division HTML avec classe CSS
public struct HTMLDiv: HTML {
    var className: String?
    var children: [HTML]
    
    public init(className: String? = nil, @HTMLBuilderArray _ children: () -> [HTML]) {
        self.className = className
        self.children = children()
    }
    
    public func render() -> String {
        let classAttr = className != nil ? " class='\(className!)'" : ""
        return "<div\(classAttr)>\n" +
        children.render() +
        "\n</div>"
    }
}
