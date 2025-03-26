import SwiftUI

/// **HTMLDiv** : Division HTML avec classe CSS
struct HTMLDiv: HTML {
    var className: String?
    var id: String?
    var style: String?
    var onClick: String?
    var attributes: [String: String]
    var children: [HTML]
    
    public init(
        className: String? = nil,
        id: String? = nil,
        style: String? = nil,
        onClick: String? = nil,
        attributes: [String: String] = [:],
        @HTMLBuilderArray _ children: () -> [HTML]
    ) {
        self.className = className
        self.id = id
        self.style = style
        self.onClick = onClick
        self.attributes = attributes
        self.children = children()
    }
    
    public func render() -> String {
        var attrList: [String] = []
        if let className = className { attrList.append("class='\(className)'") }
        if let id = id { attrList.append("id='\(id)'") }
        if let style = style { attrList.append("style='\(style)'") }
        if let onClick = onClick { attrList.append("onclick='\(onClick)'") }
        for (key, value) in attributes {
            attrList.append("\(key)='\(value)'")
        }
        
        let attrString = attrList.isEmpty ? "" : " " + attrList.joined(separator: " ")
        
        return """
        <div\(attrString)>
        \(children.map { $0.render() }.joined(separator: "\n"))
        </div>
        """
    }
}
