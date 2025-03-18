import SwiftUI

public struct HTMLImage: HTML {
    var src: String
    var alt: String?
    
    public init(src: String, alt: String? = nil) {
        self.src = src
        self.alt = alt
    }
    
    public func render() -> String {
        let altAttr = alt != nil ? " alt='\(alt!)'" : ""
        return "<img src='\(src)'\(altAttr) />"
    }
}
