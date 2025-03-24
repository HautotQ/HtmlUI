import SwiftUI

public struct HTMLButton: HTML {
    var type: String?
    var className: String?
    var id: String?
    var onClick: String? // Ajout de l'attribut onClick
    var children: any HTML // Utilisation de [any HTML] au lieu de [HTML]
    
    public init(type: String? = nil, className: String? = nil, id: String? = nil, onClick: String? = nil, @HTMLBuilder _ children: () -> any HTML) {
        self.type = type
        self.className = className
        self.id = id
        self.onClick = onClick
        self.children = children()
    }
    
    public func render() -> String {
        let typeAttr = type.map { " type='\($0)'" } ?? ""
        let classAttr = className.map { " class='\($0)'" } ?? ""
        let idAttr = id.map { " id='\($0)'" } ?? ""
        let onClickAttr = onClick.map { " onClick='\($0)'" } ?? "" // Gère l'attribut onClick
        
        return "<button\(typeAttr)\(classAttr)\(idAttr)\(onClickAttr)>\n" +
        children.render()/*map { $0.render() }.joined(separator: "\n")*/ +
        "\n</button>"
    }
}
