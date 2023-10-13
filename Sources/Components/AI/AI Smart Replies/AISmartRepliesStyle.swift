//
//  AISmartRepliesStyle.swift
//  
//
//  Created by SuryanshBisen on 14/09/23.
//

import Foundation
import UIKit

public class AISmartRepliesStyle: AIParentRepliesStyle {
    
    var buttonTextColor: UIColor?
    var buttonTextFont: UIFont?
    var buttonBorder: CGFloat?
    var buttonBorderRadius: CGFloat?
    var buttonHeight: CGFloat?
    var buttonWidth: CGFloat?
    var buttonBackground: UIColor?

    @discardableResult
    @objc public func setButtonTextColor(colour: UIColor) -> Self {
        self.buttonTextColor = colour
        return self
    }
    
    @discardableResult
    @objc public func setButtonTextFont(font: UIFont) -> Self {
        self.buttonTextFont = font
        return self
    }
    
    @discardableResult
    @objc public func setButtonBorder(border: CGFloat) -> Self {
        self.buttonBorder = border
        return self
    }
    
    @discardableResult
    @objc public func setButtonBorderRadius(radius: CGFloat) -> Self {
        self.buttonBorderRadius = radius
        return self
    }
    
    @discardableResult
    @objc public func setButtonHeight(height: CGFloat) -> Self {
        self.buttonHeight = height
        return self
    }
    
    @discardableResult
    @objc public func setButtonWidth(width: CGFloat) -> Self {
        self.buttonWidth = width
        return self
    }
    
    @discardableResult
    @objc public func setButtonBackground(colour: UIColor) -> Self {
        self.buttonBackground = colour
        return self
    }

}