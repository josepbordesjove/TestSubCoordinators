import UIKit

// MARK: - Current Stylesheet

/**
 Returns the current stylesheet as `StylesheetConfigurable`.
 
 - returns: A `StylesheetConfigurable` (which is `StylesheetWallapop`).
 
 - seealso: `StylesheetWallapop.swift`
 */
public let Stylesheet: StylesheetConfigurable.Type = StylesheetWallapop.self

public typealias GradientColor = (color: UIColor, location: Double)

// MARK: - Enums

public enum Typeface: Int {
    case thin
    case regular
    case bold
}

public enum Font: Int {
    /// Wallie-Fit - Regular - 10
    case tiny
    /// Wallie-Fit - Regular - 12
    case extraInfo
    /// Wallie-Chunky - Bold - 12
    case extraInfoHighlighted
    /// Wallie-Fit - Regular - 14
    case caption
    /// Wallie-Chunky - Bold - 14
    case captionHighlighted
    /// Wallie-Fit - Regular - 16
    case body
    /// Wallie-Chunky - Bold - 16
    case bodyHighlighted
    /// Wallie-Fit - Regular - 20
    case headline
    /// Wallie-Chunky - Bold - 20
    case headlineHighlighted
    /// Wallie-Fit - Regular - 32
    case display
    /// Wallie-Chunky - Bold - 32
    case displayHighlighted
    /// Wallie-Skinny - Thin - 32
    case displaySkinny
    /// Wallie-Chunky - Bold - 40
    case subtitleHighlighted
    /// Wallie-Fit - Regular - 50
    case title
    /// Wallie-Chunky - Bold - 50
    case titleHighlighted
    /// Wallie-Chunky - Bold - 100
    case commonDisplay
}

public enum Margin: Int {
    /// 0 points
    case zero
    /// 1 points
    case one
    /// 2 points
    case smallest
    /// 4 points
    case small
    /// 8 points
    case medium
    /// 12 points
    case big
    // NOTE: @tr3sG right now design is working in a new stylesheet where there will be a few new values. The naming for that new stylesheet will be the same as the t-shirts: xs, s, m, l, xl, etc. I needed of of those new values, so I added here using the new naming, but keep in mind that we will need to refactor this as soon as the new stylesheet is final.
    /// 16 points
    case m
    /// 20 points
    case bigger
    /// 26 points
    case l
    /// 32 points
    case biggest
    /// 60 points
    case huge
}

public enum Height: Int {
    case header
}

public enum CornerRadius: Int {
    case general
    case generalX2
}

public enum ColorState: Int {
    case primary
    case negative
    case positive
}

public enum ColorPalette: Int {
    case walla, payBlue, skyBlue, softBlue, magenta, yellow, orange, positive, negative, purple, clear, socialBlue, socialRed
}

public enum Variant: Int, Equatable {
    case normal, dark, soft
}

public enum DarkPalette: Int {
    case black, grey1, grey2, grey3, grey4, grey5, grey6, white
}

public enum GradientPalette: Int {
    case caribe, nuclear, grape, yellow, purple, blue, softBlue, lightBlue, blueSteel, darkShipping, greyPro
}

// MARK: - StylesheetConfigurable

public protocol StylesheetConfigurable {
    /**
     Returns the `CGFloat` value with width for an border.
     */
    static var borderThickness: CGFloat { get }

    /**
     Returns the `CGFloat` value for the specified `Margin`.

     - parameter margin: The `Margin` type.

     - returns: The margin value as `CGFloat` based on the specified `Margin`.
     */
    static func margin(_ margin: Margin) -> CGFloat
    
    /**
     Returns the `CGFloat` value for the specified `CornerRadius`.

     - parameter cornerRadius: The `CornerRadius` type.

     - returns: The corner radius value as `CGFloat` based on the specified `CornerRadius`.
     */
    static func cornerRadius(_ cornerRadius: CornerRadius) -> CGFloat
}

/**
 This is the style guide of Wallapop, every color, font, icon, margin... every thing related to design defined as
 a specification that should be applied globally, must be here.

 - seealso: This style guide is based on the work defined and exposed on
 [Confluence](https://confluence.wallapop.com/display/APPS/Style+Library)
 */
public struct StylesheetWallapop: StylesheetConfigurable {}


// MARK: - Layout

extension StylesheetConfigurable {
    public static var borderThickness: CGFloat { 1 / UIScreen.main.scale }

    public static func margin(_ margin: Margin) -> CGFloat {
        switch margin {
        case .zero:
            return 0.0
        case .one:
            return 1.0
        case .smallest:
            return 2.0
        case .small:
            return 4.0
        case .medium:
            return 8.0
        case .big:
            return 12.0
        case .m:
            return 16.0
        case .bigger:
            return 20.0
        case .l:
            return 26.0
        case .biggest:
            return 32.0
        case .huge:
            return 60.0
        }
    }

    static func height(_ height: Height) -> CGFloat {
        switch height {
        case .header:
            return 54
        }
    }

    public static func cornerRadius(_ cornerRadius: CornerRadius) -> CGFloat {
        switch cornerRadius {
        case .general:
            return 10
        case .generalX2:
            return 20
        }
    }
}
