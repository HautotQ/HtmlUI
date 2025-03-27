import SwiftUI

public struct Body: HTML {
    private var generalStyles: [String]
    private var classStyles: [String: [String]]
    private var idStyles: [String: [String]]

    public init(@CSSBuilder _ generalStyles: () -> [String]) {
        self.generalStyles = generalStyles()
        self.classStyles = [:]
        self.idStyles = [:]
    }

    private init(generalStyles: [String], classStyles: [String: [String]], idStyles: [String: [String]]) {
        self.generalStyles = generalStyles
        self.classStyles = classStyles
        self.idStyles = idStyles
    }

    public func addClassName(_ className: String, @CSSBuilder _ properties: () -> [String]) -> Body {
        var newClassStyles = self.classStyles
        newClassStyles[className] = properties()
        return Body(generalStyles: self.generalStyles, classStyles: newClassStyles, idStyles: self.idStyles)
    }

    public func addID(_ id: String, @CSSBuilder _ properties: () -> [String]) -> Body {
        var newIDStyles = self.idStyles
        newIDStyles[id] = properties()
        return Body(generalStyles: self.generalStyles, classStyles: self.classStyles, idStyles: newIDStyles)
    }

    public func render() -> String {
        var styles = [String]()

        if !generalStyles.isEmpty {
            styles.append("body { " + generalStyles.joined(separator: " ") + " }")
        }

        for (className, properties) in classStyles {
            styles.append(".\(className) { " + properties.joined(separator: " ") + " }")
        }

        for (id, properties) in idStyles {
            styles.append("#\(id) { " + properties.joined(separator: " ") + " }")
        }

        return styles.joined(separator: "\n")
    }
}
