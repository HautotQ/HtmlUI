import SwiftUI

struct HTMLNav: HTML {
    var destination: HTMLDocument
    var label: [any HTML]
    
    init(destination: HTMLDocument, @HTMLBuilder content: () -> [any HTML]) {
        self.destination = destination
        self.label = content()
    }
    
    func render() -> String {
        return """
        <a href="\(destination.title.lowercased()).html">
            \(label.map { $0.render() }.joined(separator: "\n"))
        </a>
        """
    }
}
