import Foundation
import UIKit

public enum FormatBarOverflowState {
    case hidden
    case visible
}

public protocol FormatBarDelegate : NSObjectProtocol {
    /// Prompts the delegate that the bar item with the specified identifier was tapped,
    /// and it should take appropriate action.
    ///
    func handleActionForIdentifier(_ identifier: FormattingIdentifier, barItem: FormatBarItem)

    /// Informs the delegate that a touch down event was received on the format bar.
    ///
    func formatBarTouchesBegan(_ formatBar: FormatBar)

    /// Called when the overflow items in the format bar are either shown or hidden
    /// as a result of the user tapping the toggle button.
    ///
    func formatBar(_ formatBar: FormatBar, didChangeOverflowState overflowState: FormatBarOverflowState)
}
