import SwiftUI

public struct HTMLNav: HTML {
    var destination: HTMLDocument
    var label: [any HTML]
    
    public init(destination: HTMLDocument, @HTMLBuilderArray content: () -> [any HTML]) {
        self.destination = destination
        self.label = content()
    }
    
    public func render() -> String {
        return """
        <a href="\(destination.title.lowercased()).html">
            \(label.map { $0.render() }.joined(separator: "\n"))
        </a>
        """
    }
}
