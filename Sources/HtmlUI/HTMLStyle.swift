import SwiftUI

/// Le style pour les widgets HTML en Swift
public struct HTMLStyle: HTML {
    var styles: [any HTML]
    
    public init(@HTMLBuilder _ styles: () -> [any HTML]) {
        self.styles = styles()
    }
    
    public func render() -> String {
        return "<style>\n" + styles.map { $0.render() }.joined(separator: "\n") + "\n</style>"
    }
}
