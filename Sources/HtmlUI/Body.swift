import SwiftUI

public struct Body: HTML {
    private var generalStyles: [String]
    private var classStyles: [String: [String]]
    
    public init(@CSSBuilder _ generalStyles: () -> [String]) {
        self.generalStyles = generalStyles()
        self.classStyles = [:]
    }
    
    private init(generalStyles: [String], classStyles: [String: [String]]) {
        self.generalStyles = generalStyles
        self.classStyles = classStyles
    }
    
    public func addClassName(_ className: String, @CSSBuilder _ properties: () -> [String]) -> Body {
        var newClassStyles = self.classStyles
        newClassStyles[className] = properties()
        return Body(generalStyles: self.generalStyles, classStyles: newClassStyles)
    }
    
    public func render() -> String {
        var styles = [String]()
        
        if !generalStyles.isEmpty {
            styles.append("body { " + generalStyles.joined(separator: " ") + " }")
        }
        
        for (className, properties) in classStyles {
            styles.append(".\(className) { " + properties.joined(separator: " ") + " }")
        }
        
        return styles.joined(separator: "\n")
    }
}
