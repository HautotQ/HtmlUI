import SwiftUI

/// Protocole HTMLDocument avec ajout de `style`
protocol HTMLDocument {
    var title: String { get }
    var lang: String { get }
    var body: HTML { get }
    var script: HTML { get }
    var style: HTML { get }
    
    func render() -> String
}

/// Extension pour générer le HTML complet
extension HTMLDocument {
    func render() -> String {
        return """
        <!DOCTYPE html>
        <html lang="\(lang)">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
