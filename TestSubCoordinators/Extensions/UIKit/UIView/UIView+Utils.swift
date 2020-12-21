import UIKit

extension UIView {
    class func reuseIdentifier(suffix: String? = "ID") -> String {
        "\(self)\(suffix ?? "")"
    }
}

extension UIView {
    @nonobjc
    public func constraintEdges(to view: UIView? = nil, useSafeArea: Bool = false, constant: LayoutMargins = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let horizontalConstraints = constraintEdgesHorizontally(to: view, useSafeArea: useSafeArea, constant: constant.horizontal, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let verticalConstraints = constraintEdgesVertically(to: view, useSafeArea: useSafeArea, constant: constant.vertical, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return horizontalConstraints + verticalConstraints
    }

    @nonobjc
    public func constraintEdgesHorizontally(to view: UIView? = nil, useSafeArea: Bool = false, constant: LayoutMargins.Horizontal = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let leading = constraintLeading(to: view, useSafeArea: useSafeArea, constant: constant.leading, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let trailing = constraintTrailing(to: view, useSafeArea: useSafeArea, constant: constant.trailing, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return leading + trailing
    }

    @nonobjc
    public func constraintEdgesHorizontally(to view: UIView? = nil, useSafeArea: Bool = false, constant: LayoutMargins.Horizontal = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, height: CGFloat, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let horizontal = constraintEdgesHorizontally(to: view, useSafeArea: useSafeArea, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let height = constraintHeight(height, file: file, method: method, line: line)
        return horizontal + height
    }

    @nonobjc
    public func constraintEdgesVertically(to view: UIView? = nil, useSafeArea: Bool = false, constant: LayoutMargins.Vertical = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let top = constraintTop(to: view, useSafeArea: useSafeArea, constant: constant.top, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let bottom = constraintBottom(to: view, useSafeArea: useSafeArea, constant: constant.bottom, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return top + bottom
    }

    @nonobjc
    public func constraintEdgesVertically(to view: UIView? = nil, useSafeArea: Bool = false, constant: LayoutMargins.Vertical = .zero, priority: UILayoutPriority = .required, width: CGFloat, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let vertical = constraintEdgesVertically(to: view, useSafeArea: useSafeArea, constant: constant, priority: priority, file: file, method: method, line: line)
        let width = constraintWidth(width, file: file, method: method, line: line)
        return vertical + width
    }

    @nonobjc
    public func constraintLeading(toTrailing view: UIView, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintLeading(toAnchor: view.trailingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintTop(toBottom view: UIView, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintTop(toAnchor: view.bottomAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintLeading(to view: UIView? = nil, useSafeArea: Bool = false, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let leadingAnchor: NSLayoutXAxisAnchor
        if useSafeArea, #available(iOS 11.0, *) {
            leadingAnchor = constraintsView.safeAreaLayoutGuide.leadingAnchor
        } else {
            leadingAnchor = constraintsView.leadingAnchor
        }
        return constraintLeading(toAnchor: leadingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintLeading(toAnchor: NSLayoutXAxisAnchor, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintXAxisAnchor(leadingAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintTrailing(to view: UIView? = nil, useSafeArea: Bool = false, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let trailingAnchor: NSLayoutXAxisAnchor
        if useSafeArea, #available(iOS 11.0, *) {
            trailingAnchor = constraintsView.safeAreaLayoutGuide.trailingAnchor
        } else {
            trailingAnchor = constraintsView.trailingAnchor
        }
        return constraintTrailing(toAnchor: trailingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintTrailing(toAnchor: NSLayoutXAxisAnchor, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintXAxisAnchor(trailingAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintTrailing(toLeading view: UIView, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintTrailing(toAnchor: view.leadingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintTop(to view: UIView? = nil, useSafeArea: Bool = false, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let topAnchor: NSLayoutYAxisAnchor
        if useSafeArea, #available(iOS 11.0, *) {
            topAnchor = constraintsView.safeAreaLayoutGuide.topAnchor
        } else {
            topAnchor = constraintsView.topAnchor
        }
        return constraintTop(toAnchor: topAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintTop(toAnchor: NSLayoutYAxisAnchor, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintYAxisAnchor(topAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintBottom(to view: UIView? = nil, useSafeArea: Bool = false, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let bottomAnchor: NSLayoutYAxisAnchor
        if useSafeArea, #available(iOS 11.0, *) {
            bottomAnchor = constraintsView.safeAreaLayoutGuide.bottomAnchor
        } else {
            bottomAnchor = constraintsView.bottomAnchor
        }
        return constraintBottom(toAnchor: bottomAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintBottom(toAnchor: NSLayoutYAxisAnchor, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintYAxisAnchor(bottomAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintCenter(to view: UIView? = nil, multiplier: CGPoint = CGPoint(x: 1, y: 1), constant: (x: SignedMargin, y: SignedMargin) = (.zero, .zero), relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let x = constraintCenterX(to: view, multiplier: multiplier.x, constant: constant.x, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let y = constraintCenterY(to: view, multiplier: multiplier.y, constant: constant.y, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return x + y
    }

    @nonobjc
    public func constraintCenterX(to view: UIView? = nil, multiplier: CGFloat = 1, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        return constraintAttribute(.centerX,
                                   relatedBy: relation,
                                   to: constraintsView,
                                   attribute: .centerX,
                                   multiplier: multiplier,
                                   constant: constant,
                                   priority: priority,
                                   file: file,
                                   method: method,
                                   line: line)
    }

    @nonobjc
    public func constraintCenterY(to view: UIView? = nil, multiplier: CGFloat = 1, constant: SignedMargin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        return constraintAttribute(.centerY,
                                   relatedBy: relation,
                                   to: constraintsView,
                                   attribute: .centerY,
                                   multiplier: multiplier,
                                   constant: constant,
                                   priority: priority,
                                   file: file,
                                   method: method,
                                   line: line)
    }

    @nonobjc
    public func constraintSize(_ size: CGSize, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let width: [NSLayoutConstraint]
        let height: [NSLayoutConstraint]
        width = constraintWidth(size.width, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        height = constraintHeight(size.height, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return width + height
    }

    @nonobjc
    public func constraintSize(to view: UIView? = nil, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let width: [NSLayoutConstraint]
        let height: [NSLayoutConstraint]
        if let view = view {
            width = constraintWidth(toAnchor: view.widthAnchor, relatedBy: relation, priority: priority, file: file, method: method, line: line)
            height = constraintHeight(toAnchor: view.heightAnchor, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        } else {
            width = constraintWidth(relatedBy: relation, priority: priority, file: file, method: method, line: line)
            height = constraintHeight(relatedBy: relation, priority: priority, file: file, method: method, line: line)
        }
        return width + height
    }

    @nonobjc
    public func constraintWidth(_ width: CGFloat, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintDimensionAnchor(widthAnchor, constant: width, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintWidth(toAnchor: NSLayoutDimension? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let anchor = toAnchor ?? superview!.widthAnchor
        return constraintDimensionAnchor(widthAnchor, toAnchor: anchor, multiplier: multiplier, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintHeight(_ height: CGFloat, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return constraintDimensionAnchor(heightAnchor, constant: height, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintHeight(toAnchor: NSLayoutDimension? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let anchor = toAnchor ?? superview!.heightAnchor
        return constraintDimensionAnchor(heightAnchor, toAnchor: anchor, multiplier: multiplier, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    public func constraintAttribute(_ receiverAttribute: NSLayoutConstraint.Attribute,
                                    relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                    to view: UIView,
                                    attribute toAttribute: NSLayoutConstraint.Attribute,
                                    multiplier: CGFloat = 1,
                                    constant: SignedMargin = .zero,
                                    priority: UILayoutPriority = .required,
                                    file: String = #file,
                                    method: String = #function,
                                    line: Int = #line) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: receiverAttribute,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: toAttribute,
                                            multiplier: multiplier,
                                            constant: constant.value)
        constraint.priority = priority
        return [constraint]
    }

    @nonobjc
    public func distributeHorizontallyViewsInSuperview(_ views: [UIView], file: String = #file, method: String = #function, line: Int = #line) {
        guard let firstView = views.first else { return }
        guard let lastView = views.last else { return }

        var constraints: [[NSLayoutConstraint]] = [
            firstView.constraintLeading(file: file, method: method, line: line),
            lastView.constraintTrailing(file: file, method: method, line: line)
        ]
        for i in 1..<views.count {
            let view = views[i]
            let previousView = views[i - 1]
            constraints.append(view.constraintLeading(toTrailing: previousView, file: file, method: method, line: line))
        }
        NSLayoutConstraint.activateNested(constraints)
    }

    @nonobjc
    @discardableResult
    public func constraints(replace old: [NSLayoutConstraint], with new: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        NSLayoutConstraint.deactivate(old)
        removeConstraints(old)
        NSLayoutConstraint.activateNested([
            new
        ])
        return new
    }

    // MARK: Private

    @nonobjc
    private func constraintYAxisAnchor(_ anchor: NSLayoutXAxisAnchor, constant: SignedMargin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        return constraintXAxisAnchor(anchor, toAnchor: anchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    private func constraintXAxisAnchor(_ anchor: NSLayoutXAxisAnchor, toAnchor: NSLayoutXAxisAnchor, constant: SignedMargin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: toAnchor, constant: constant.value)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: constant.value)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: toAnchor, constant: constant.value)
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }

    @nonobjc
    private func constraintYAxisAnchor(_ anchor: NSLayoutYAxisAnchor, constant: SignedMargin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        return constraintYAxisAnchor(anchor, toAnchor: anchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }

    @nonobjc
    private func constraintYAxisAnchor(_ anchor: NSLayoutYAxisAnchor, toAnchor: NSLayoutYAxisAnchor, constant: SignedMargin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: toAnchor, constant: constant.value)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: constant.value)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: toAnchor, constant: constant.value)
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }

    @nonobjc
    private func constraintDimensionAnchor(_ anchor: NSLayoutDimension, constant: CGFloat, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalToConstant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }

    @nonobjc
    private func constraintDimensionAnchor(_ anchor: NSLayoutDimension, toAnchor: NSLayoutDimension, multiplier: CGFloat, constant: CGFloat, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: toAnchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: toAnchor, multiplier: multiplier, constant: constant)
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }
}

// MARK: - Activation

extension Array where Element: NSLayoutConstraint {
    @nonobjc
    public var isActive: Bool {
        get {
#if DEBUG
            let filterCount = filter { $0.isActive == false }.count
            if filterCount != 0, filterCount != count {
                assertionFailure("WATCH OUT: you should know what you're doing, this array contains active and/or/y not active NSLayoutConstraints")
            }
#endif
            return filter { $0.isActive == false }.first == nil
        }
        set {
            if newValue {
                NSLayoutConstraint.activate(self)
            } else {
                NSLayoutConstraint.deactivate(self)
            }
        }
    }
}

extension Array where Element == [NSLayoutConstraint] {
    public func activateNestedConstraints() {
        NSLayoutConstraint.activateNested(self)
    }

    public func deactivateNestedConstraints() {
        NSLayoutConstraint.deactivateNested(self)
    }
}

extension NSLayoutConstraint {
    @nonobjc
    public static func activateNested(_ constraints: [[NSLayoutConstraint]]) {
        constraints.joined().forEach { constraint in
            (constraint.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(constraints.flatMap { $0 })
    }

    @nonobjc
    public static func deactivateNested(_ constraints: [[NSLayoutConstraint]]) {
        NSLayoutConstraint.deactivate(constraints.flatMap { $0 })
    }
}

// MARK: - Margins

public enum SignedMargin {
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
    case negative(Margin)

    public init(margin: Margin, sign: Int = 1) {
        if sign < 0 {
            self = .negative(margin)
        } else {
            switch margin {
            case .zero: self = .zero
            case .one: self = .one
            case .smallest: self = .smallest
            case .small: self = .small
            case .medium: self = .medium
            case .big: self = .big
            case .m: self = .m
            case .bigger: self = .bigger
            case .l: self = .l
            case .biggest: self = .biggest
            case .huge: self = .huge
            }
        }
    }

    public var value: CGFloat {
        return CGFloat(sign) * Stylesheet.margin(margin)
    }

    fileprivate var margin: Margin {
        switch self {
        case .zero: return .zero
        case .one: return .one
        case .smallest: return .smallest
        case .small: return .small
        case .medium: return .medium
        case .big: return .big
        case .m: return .m
        case .bigger: return .bigger
        case .l: return .l
        case .biggest: return .biggest
        case .huge: return .huge
        case .negative(let margin): return margin
        }
    }

    fileprivate var sign: Int {
        switch self {
        case .zero, .one, .smallest, .small, .medium, .big, .m, .bigger, .l, .biggest, .huge: return 1
        case .negative: return -1
        }
    }
}

public prefix func - (value: SignedMargin) -> SignedMargin {
    return SignedMargin(margin: value.margin, sign: -value.sign)
}

public struct LayoutMargins {
    public struct Horizontal {
        public let leading: SignedMargin
        public let trailing: SignedMargin

        public static var zero: LayoutMargins.Horizontal { return Horizontal(leading: .zero, trailing: -.zero) }
        public static var one: LayoutMargins.Horizontal { Horizontal(leading: .one, trailing: -.one) }
        public static var smallest: LayoutMargins.Horizontal { return Horizontal(leading: .smallest, trailing: -.smallest) }
        public static var small: LayoutMargins.Horizontal { return Horizontal(leading: .small, trailing: -.small) }
        public static var medium: LayoutMargins.Horizontal { return Horizontal(leading: .medium, trailing: -.medium) }
        public static var big: LayoutMargins.Horizontal { return Horizontal(leading: .big, trailing: -.big) }
        public static var m: LayoutMargins.Horizontal { return Horizontal(leading: .m, trailing: -.m) }
        public static var bigger: LayoutMargins.Horizontal { return Horizontal(leading: .bigger, trailing: -.bigger) }
        public static var l: LayoutMargins.Horizontal { return Horizontal(leading: .l, trailing: -.l) }
        public static var biggest: LayoutMargins.Horizontal { return Horizontal(leading: .biggest, trailing: -.biggest) }
        public static var huge: LayoutMargins.Horizontal { return Horizontal(leading: .huge, trailing: -.huge) }
    }

    public struct Vertical {
        public let top: SignedMargin
        public let bottom: SignedMargin

        public static var zero: LayoutMargins.Vertical { return Vertical(top: .zero, bottom: -.zero) }
        public static var one: LayoutMargins.Vertical { Vertical(top: .one, bottom: -.one) }
        public static var smallest: LayoutMargins.Vertical { return Vertical(top: .smallest, bottom: -.smallest) }
        public static var small: LayoutMargins.Vertical { return Vertical(top: .small, bottom: -.small) }
        public static var medium: LayoutMargins.Vertical { return Vertical(top: .medium, bottom: -.medium) }
        public static var big: LayoutMargins.Vertical { return Vertical(top: .big, bottom: -.big) }
        public static var m: LayoutMargins.Vertical { return Vertical(top: .m, bottom: -.m) }
        public static var bigger: LayoutMargins.Vertical { return Vertical(top: .bigger, bottom: -.bigger) }
        public static var l: LayoutMargins.Vertical { return Vertical(top: .l, bottom: -.l) }
        public static var biggest: LayoutMargins.Vertical { return Vertical(top: .biggest, bottom: -.biggest) }
        public static var huge: LayoutMargins.Vertical { return Vertical(top: .huge, bottom: -.huge) }
    }

    public let horizontal: LayoutMargins.Horizontal
    public let vertical: LayoutMargins.Vertical

    public var top: SignedMargin { return vertical.top }
    public var leading: SignedMargin { return horizontal.leading }
    public var trailing: SignedMargin { return horizontal.trailing }
    public var bottom: SignedMargin { return vertical.bottom }

    public static var zero: LayoutMargins { return LayoutMargins(horizontal: .zero, vertical: .zero) }
    public static var one: LayoutMargins { LayoutMargins(horizontal: .one, vertical: .one) }
    public static var smallest: LayoutMargins { return LayoutMargins(horizontal: .smallest, vertical: .smallest) }
    public static var small: LayoutMargins { return LayoutMargins(horizontal: .small, vertical: .small) }
    public static var medium: LayoutMargins { return LayoutMargins(horizontal: .medium, vertical: .medium) }
    public static var big: LayoutMargins { return LayoutMargins(horizontal: .big, vertical: .big) }
    public static var m: LayoutMargins { return LayoutMargins(horizontal: .m, vertical: .m) }
    public static var bigger: LayoutMargins { return LayoutMargins(horizontal: .bigger, vertical: .bigger) }
    public static var l: LayoutMargins { return LayoutMargins(horizontal: .l, vertical: .l) }
    public static var biggest: LayoutMargins { return LayoutMargins(horizontal: .biggest, vertical: .biggest) }
    public static var huge: LayoutMargins { return LayoutMargins(horizontal: .huge, vertical: .huge) }

    public init(horizontal: LayoutMargins.Horizontal, vertical: LayoutMargins.Vertical) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
}

extension LayoutMargins: ExpressibleByArrayLiteral {
    public typealias Element = SignedMargin

    public init(arrayLiteral: Element...) {
        var margins = [Element]()
        for element in arrayLiteral {
            margins.append(element)
        }
        assert(margins.count == 4, "Invalid number of elements. Expected 4, got \(margins.count).")
        self.init(horizontal: LayoutMargins.Horizontal(leading: margins[1], trailing: margins[3]),
                  vertical: LayoutMargins.Vertical(top: margins[0], bottom: margins[2]))
    }
}

extension LayoutMargins.Horizontal: ExpressibleByArrayLiteral {
    public typealias Element = SignedMargin

    public init(arrayLiteral: Element...) {
        var margins = [Element]()
        for element in arrayLiteral {
            margins.append(element)
        }
        assert(margins.count == 2, "Invalid number of elements. Expected 2, got \(margins.count).")
        self.init(leading: margins[0], trailing: margins[1])
    }
}

extension LayoutMargins.Vertical: ExpressibleByArrayLiteral {
    public typealias Element = SignedMargin

    public init(arrayLiteral: Element...) {
        var margins = [Element]()
        for element in arrayLiteral {
            margins.append(element)
        }
        assert(margins.count == 2, "Invalid number of elements. Expected 2, got \(margins.count).")
        self.init(top: margins[0], bottom: margins[1])
    }
}

extension UIEdgeInsets {
    @nonobjc
    public init(layoutMargins: LayoutMargins) {
        self = UIEdgeInsets(top: layoutMargins.top.value,
                            left: layoutMargins.leading.value,
                            bottom: layoutMargins.bottom.value,
                            right: layoutMargins.trailing.value)
    }

    @nonobjc
    public init(layoutMarginsHorizontal: LayoutMargins.Horizontal) {
        self = UIEdgeInsets(top: 0,
                            left: layoutMarginsHorizontal.leading.value,
                            bottom: 0,
                            right: layoutMarginsHorizontal.trailing.value)
    }

    @nonobjc
    public init(layoutMarginsVertical: LayoutMargins.Vertical) {
        self = UIEdgeInsets(top: layoutMarginsVertical.top.value,
                            left: 0,
                            bottom: layoutMarginsVertical.bottom.value,
                            right: 0)
    }

    @nonobjc
    public init(topMargin: SignedMargin,
                leftMargin: SignedMargin,
                bottomMargin: SignedMargin,
                rightMargin: SignedMargin) {
        self = UIEdgeInsets(top: topMargin.value,
                            left: leftMargin.value,
                            bottom: bottomMargin.value,
                            right: rightMargin.value)
    }
}

extension UIView {
    @nonobjc
    public var topAnchorUsingSafeArea: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }
}
