//
//  ActionDelegate.swift
//  StripePaymentPOC
//
//  Created by Swetha Sreekanth on 8/11/20.
//  Copyright © 2020 DesiDesign. All rights reserved.
//


import Foundation

public protocol DelegateAction {}
public protocol ActionDelegate: class {
    func actionSender(didReceiveAction action: DelegateAction)

}
