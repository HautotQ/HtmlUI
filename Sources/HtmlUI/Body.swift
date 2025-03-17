import SwiftUI

struct Body: HTML {
    private var generalStyles: [String]
    private var classStyles: [String: [String]]
    
    init(@CSSBuilder _ generalStyles: () -> [String]) {
        self.generalStyles = generalStyles()
        self.classStyles = [:]
    }
    
    private init(generalStyles: [String], classStyles: [String: [String]]) {
        self.generalStyles = generalStyles
        self.classStyles = classStyles
    }
    
    func addClassName(_ className: String, @CSSBuilder _ properties: () -> [String]) -> Body {
        var newClassStyles = self.classStyles
        newClassStyles[className] = properties()
        return Body(generalStyles: self.generalStyles, classStyles: newClassStyles)
    }
    
    func render() -> String {
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
