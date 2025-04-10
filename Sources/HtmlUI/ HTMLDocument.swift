import SwiftUI

/// Protocole HTMLDocument avec `style`, `script` et maintenant `head` personnalisable
public protocol HTMLDocument {
    var title: String { get }
    var lang: String { get }
    var head: HTML { get } // Nouvelle propriété
    var body: HTML { get }
    var script: HTML { get }
    var style: HTML { get }
}

/// Extension pour générer le HTML complet
public extension HTMLDocument {
    func render() -> String {
        return """
        <!DOCTYPE html>
        <html lang="\(lang)">
        <head>
            <meta charset="UTF-8">
            \(head.render())
            <title>\(title)</title>
            \(style.render())
        </head>
        <body>
            \(body.render())
            \(script.render())
        </body>
        </html>
        """
    }
}
