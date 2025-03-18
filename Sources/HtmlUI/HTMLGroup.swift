import SwiftUI

/// **HTMLGroup** : Permet de regrouper plusieurs éléments HTML
public struct HTMLGroup: HTML {
    var children: () -> [HTML]
    
    init(_ children: @escaping () -> [HTML]) {
        self.children = children
    }
    
    public func render() -> String {
        return children().map { $0.render() }.joined(separator: "\n")
    }
}
