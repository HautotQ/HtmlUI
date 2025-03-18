import SwiftUI

public struct HTMLButton: HTML {
    var type: String?
    var className: String?
    var id: String?
    var onClick: String? // Ajout de l'attribut onClick
    var children: [HTML]
    
    public init(type: String? = nil, className: String? = nil, id: String? = nil, onClick: String? = nil, @HTMLBuilder _ children: () -> [HTML]) {
        self.type = type
        self.className = className
        self.id = id
        self.onClick = onClick
        self.children = children()
    }
    
    public func render() -> String {
        let typeAttr = type != nil ? " type='\(type!)'" : ""
        let classAttr = className != nil ? " class='\(className!)'" : ""
        let idAttr = id != nil ? " id='\(id!)'" : ""
        let onClickAttr = onClick != nil ? " onClick='\(onClick!)'" : "" // Gère l'attribut onClick
        
        return "<button\(typeAttr)\(classAttr)\(idAttr)\(onClickAttr)>\n" +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</button>"
    }
}
