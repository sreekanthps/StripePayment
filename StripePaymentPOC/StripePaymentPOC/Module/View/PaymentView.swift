//
//  PaymentView.swift
//  StripePaymentPOC
//
//  Created by Swetha Sreekanth on 8/11/20.
//  Copyright © 2020 DesiDesign. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

import Foundation

class PaymentView: UIView {
    enum Action: DelegateAction {
       case ButtonPressed
       
    }
    weak var delegate: ActionDelegate?

    init() {
         super.init(frame: .zero)
        configure()
        loadView()
    }
    func configure() {
        self.backgroundColor = .white
    }
    let button : UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .red
        button.setTitle("PAY NOW", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.contentMode = .center
        button.addTarget(self,action: #selector(buttonAction),
        for: .touchUpInside)
        
        return button
    }()
    let root : UIView = {
        let rootView = UIView(frame: .zero)
        return rootView
    }()
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    func loadView() {
        removeAllSubviewsAndRemoveFromSuperview()
        root.flex.define{ (flex) in
            flex.addItem(button).marginHorizontal(30).height(40).marginTop(100)
        }
        addSubview(root)
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        root.pin.all()
        
        // Then let the flexbox container layout itself
        root.flex.layout()
    }
    @objc func buttonAction() {
        self.delegate?.actionSender(didReceiveAction: Action.ButtonPressed)
    }
          
}
