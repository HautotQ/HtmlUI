import SwiftUI

/// **HTMLInput** : Élément `<input>` avec tous ses attributs possibles
public struct HTMLInput: HTML {
    var type: String
    var name: String?
    var value: String?
    var placeholder: String?
    var id: String?
    var className: String?
    var style: String?
    var onClick: String?
    var onChange: String?
    var onInput: String?
    var required: Bool
    var disabled: Bool
    var readonly: Bool
    var attributes: [String: String]
    
    public init(
        type: String,
        name: String? = nil,
        value: String? = nil,
        placeholder: String? = nil,
        id: String? = nil,
        className: String? = nil,
        style: String? = nil,
        onClick: String? = nil,
        onChange: String? = nil,
        onInput: String? = nil,
        required: Bool = false,
        disabled: Bool = false,
        readonly: Bool = false,
        attributes: [String: String] = [:]
    ) {
        self.type = type
        self.name = name
        self.value = value
        self.placeholder = placeholder
        self.id = id
        self.className = className
        self.style = style
        self.onClick = onClick
        self.onChange = onChange
        self.onInput = onInput
        self.required = required
        self.disabled = disabled
        self.readonly = readonly
        self.attributes = attributes
    }
    
    public func render() -> String {
        var attrList: [String] = ["type='\(type)'"]
        if let name = name { attrList.append("name='\(name)'") }
        if let value = value { attrList.append("value='\(value)'") }
        if let placeholder = placeholder { attrList.append("placeholder='\(placeholder)'") }
        if let id = id { attrList.append("id='\(id)'") }
        if let className = className { attrList.append("class='\(className)'") }
        if let style = style { attrList.append("style='\(style)'") }
        if let onClick = onClick { attrList.append("onclick='\(onClick)'") }
        if let onChange = onChange { attrList.append("onchange='\(onChange)'") }
        if let onInput = onInput { attrList.append("oninput='\(onInput)'") }
        if required { attrList.append("required") }
        if disabled { attrList.append("disabled") }
        if readonly { attrList.append("readonly") }
        for (key, value) in attributes {
            attrList.append("\(key)='\(value)'")
        }
        
        let attrString = attrList.joined(separator: " ")
        return "<input \(attrString) />"
    }
}
