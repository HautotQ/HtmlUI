import SwiftUI

struct HTMLCanvas: HTML {
    var width: Int?
    var height: Int?
    var className: String?
    var children: [HTML]
    
    init(width: Int? = nil, height: Int? = nil, className: String? = nil, @HTMLBuilder _ children: () -> [HTML]) {
        self.width = width
        self.height = height
        self.className = className
        self.children = children()
    }
    
    func render() -> String {
        let widthAttr = width != nil ? " width='\(width!)'" : ""
        let heightAttr = height != nil ? " height='\(height!)'" : ""
        let classAttr = className != nil ? " class='\(className!)'" : ""
        
        return "<canvas\(widthAttr)\(heightAttr)\(classAttr)>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</canvas>"
    }
}
