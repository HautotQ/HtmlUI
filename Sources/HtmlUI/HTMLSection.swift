public struct HTMLSection: HTML {
    var title: String?
    var children: [HTML]
    
    public init(title: String? = nil, @CSSBuilder _ children: () -> [HTML]) {
        self.title = title
        self.children = children()
    }
    
    public func render() -> String {
        let titleHTML = title != nil ? "<h2>\(title!)</h2>\n" : ""
        return "<section>\n" + titleHTML +
        children.map { $0.render() }.joined(separator: "\n") +
        "\n</section>"
    }
}
