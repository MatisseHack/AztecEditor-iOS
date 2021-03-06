import Foundation
import UIKit

class FontFormatter: AttributeFormatter {

    var placeholderAttributes: [String : Any]? { return nil }
    
    let htmlRepresentationKey: String
    let traits: UIFontDescriptorSymbolicTraits

    init(traits: UIFontDescriptorSymbolicTraits, htmlRepresentationKey: String) {
        self.htmlRepresentationKey = htmlRepresentationKey
        self.traits = traits
    }

    func applicationRange(for range: NSRange, in text: NSAttributedString) -> NSRange {
        return range
    }

    func worksInEmptyRange() -> Bool {
        return false
    }

    func apply(to attributes: [String : Any], andStore representation: HTMLRepresentation?) -> [String: Any] {

        guard let font = attributes[NSFontAttributeName] as? UIFont else {
            return attributes
        }

        let newFont = font.modifyTraits(traits, enable: true)

        var resultingAttributes = attributes

        resultingAttributes[NSFontAttributeName] = newFont
        resultingAttributes[htmlRepresentationKey] = representation

        return resultingAttributes
    }

    func remove(from attributes: [String : Any]) -> [String: Any] {
        var resultingAttributes = attributes
        guard let font = attributes[NSFontAttributeName] as? UIFont else {
            return attributes
        }

        let newFont = font.modifyTraits(traits, enable: false)
        resultingAttributes[NSFontAttributeName] = newFont
        
        resultingAttributes.removeValue(forKey: htmlRepresentationKey)

        return resultingAttributes
    }

    func present(in attributes: [String : Any]) -> Bool {
        guard let font = attributes[NSFontAttributeName] as? UIFont else {
            return false
        }
        let enabled = font.containsTraits(traits)
        return enabled
    }
}

