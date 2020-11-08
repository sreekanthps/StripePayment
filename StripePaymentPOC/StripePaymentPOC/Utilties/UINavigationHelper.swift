//
//  UINavigationHelper.swift
//  StripePaymentPOC
//
//  Created by Swetha Sreekanth on 8/11/20.
//  Copyright © 2020 DesiDesign. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func removeAllSubviewsAndRemoveFromSuperview() {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }

        removeFromSuperview()
    }

    public func removeAllSubviews() {
        subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
    }
}
