import SwiftUI

/// Élément <script> HTML compatible HTML5 avec tous les attributs possibles
public struct HTMLScript: HTML {
    private let script: String?
    private let src: String?
    private let type: String?
    private let async: Bool
    private let deferScript: Bool
    private let nomodule: Bool
    private let crossorigin: String?
    private let referrerpolicy: String?
    private let integrity: String?

    /// Script inline
    public init(
        type: String? = nil,
        async: Bool = false,
        defer: Bool = false,
        nomodule: Bool = false,
        crossorigin: String? = nil,
        referrerpolicy: String? = nil,
        integrity: String? = nil,
        _ script: @escaping () -> String
    ) {
        self.script = script()
        self.src = nil
        self.type = type
        self.async = async
        self.deferScript = `defer`
        self.nomodule = nomodule
        self.crossorigin = crossorigin
        self.referrerpolicy = referrerpolicy
        self.integrity = integrity
    }

    /// Script externe
    public init(
        src: String,
        type: String? = nil,
        async: Bool = false,
        defer: Bool = false,
        nomodule: Bool = false,
        crossorigin: String? = nil,
        referrerpolicy: String? = nil,
        integrity: String? = nil
    ) {
        self.script = nil
        self.src = src
        self.type = type
        self.async = async
        self.deferScript = `defer`
        self.nomodule = nomodule
        self.crossorigin = crossorigin
        self.referrerpolicy = referrerpolicy
        self.integrity = integrity
    }

    public func render() -> String {
        var attributes: [String] = []

        if let src = src {
            attributes.append("src=\"\(src)\"")
        }
        if let type = type {
            attributes.append("type=\"\(type)\"")
        }
        if async {
            attributes.append("async")
        }
        if deferScript {
            attributes.append("defer")
        }
        if nomodule {
            attributes.append("nomodule")
        }
        if let crossorigin = crossorigin {
            attributes.append("crossorigin=\"\(crossorigin)\"")
        }
        if let referrerpolicy = referrerpolicy {
            attributes.append("referrerpolicy=\"\(referrerpolicy)\"")
        }
        if let integrity = integrity {
            attributes.append("integrity=\"\(integrity)\"")
        }

        if let script = script {
            return "<script \(attributes.joined(separator: " "))>\n\(script)\n</script>"
        } else {
            return "<script \(attributes.joined(separator: " "))></script>"
        }
    }
}
