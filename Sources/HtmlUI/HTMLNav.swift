import SwiftUI

public struct HTMLNav: HTML {
    var destination: HTMLDocument
    var label: [any HTML]
    var onClick: String?
    var target: String?
    var download: String?
    var rel: String?
    var hreflang: String?
    var type: String?
    var referrerpolicy: String?
    var ping: String?
    var id: String?
    var `class`: String?
    var style: String?

    public init(
        destination: HTMLDocument,
        onClick: String? = nil,
        target: String? = nil,
        download: String? = nil,
        rel: String? = nil,
        hreflang: String? = nil,
        type: String? = nil,
        referrerpolicy: String? = nil,
        ping: String? = nil,
        id: String? = nil,
        class: String? = nil,
        style: String? = nil,
        @HTMLBuilderArray content: () -> [any HTML]
    ) {
        self.destination = destination
        self.onClick = onClick
        self.target = target
        self.download = download
        self.rel = rel
        self.hreflang = hreflang
        self.type = type
        self.referrerpolicy = referrerpolicy
        self.ping = ping
        self.id = id
        self.class = `class`
        self.style = style
        self.label = content()
    }

    public func render() -> String {
        var attributes: [String] = []
        
        if let onClick = onClick { attributes.append("onclick=\"\(onClick)\"") }
        if let target = target { attributes.append("target=\"\(target)\"") }
        if let download = download { attributes.append("download=\"\(download)\"") }
        if let rel = rel { attributes.append("rel=\"\(rel)\"") }
        if let hreflang = hreflang { attributes.append("hreflang=\"\(hreflang)\"") }
        if let type = type { attributes.append("type=\"\(type)\"") }
        if let referrerpolicy = referrerpolicy { attributes.append("referrerpolicy=\"\(referrerpolicy)\"") }
        if let ping = ping { attributes.append("ping=\"\(ping)\"") }
        if let id = id { attributes.append("id=\"\(id)\"") }
        if let `class` = `class` { attributes.append("class=\"\(`class`)\"") }
        if let style = style { attributes.append("style=\"\(style)\"") }

        let attributesString = attributes.isEmpty ? "" : " " + attributes.joined(separator: " ")
        
        return """
        <a href="\(destination.title.lowercased()).html"\(attributesString)>
            \(label.map { $0.render() }.joined(separator: "\n"))
        </a>
        """
    }
}
