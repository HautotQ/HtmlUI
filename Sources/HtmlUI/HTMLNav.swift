import SwiftUI

public struct HTMLNav: HTML {
    var destination: HTMLDocument
    var label: [any HTML]
    var onClick: String?
    
    public init(destination: HTMLDocument, onClick: String? = nil, @HTMLBuilderArray content: () -> [any HTML]) {
        self.destination = destination
        self.onClick = onClick
        self.label = content()
    }
    
    public func render() -> String {
        let onClickAttribute = onClick.map { " onclick=\"\($0)\"" } ?? ""
        return """
        <a href="\(destination.title.lowercased()).html"\(onClickAttribute)>
            \(label.map { $0.render() }.joined(separator: "\n"))
        </a>
        """
    }
}
