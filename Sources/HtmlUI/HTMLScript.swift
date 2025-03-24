import SwiftUI

/// Élément de texte HTML
struct HTMLScript: HTML {
    let script: String
    
    init(_ script: @escaping () -> String) {
        self.script = script()
    }
    
    func render() -> String {
        return "<script>\n\(script)\n</script>"
    }
}
