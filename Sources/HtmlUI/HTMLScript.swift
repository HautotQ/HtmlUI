import SwiftUI

/// Élément de texte HTML
public struct HTMLScript: HTML {
    let script: () -> String
    
    public init(_ script: @escaping () -> String) {
        self.script = script
    }
    
    public func render() -> String {
        return "<script>\(String(describing: script))</script>"
    }
}
