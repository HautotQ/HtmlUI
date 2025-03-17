import SwiftUI

/// Protocole pour définir un élément HTML
public protocol HTML {
    func render() -> String
}
