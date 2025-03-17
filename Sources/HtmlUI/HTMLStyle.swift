import SwiftUI

/// Le style pour les widgets HTML en Swift
struct HTMLStyle: HTML {
    var styles: [any HTML]
    
    init(@HTMLBuilder _ styles: () -> [any HTML]) {
        self.styles = styles()
    }
    
    func render() -> String {
        return "<style>\n" + styles.map { $0.render() }.joined(separator: "\n") + "\n</style>"
    }
}
