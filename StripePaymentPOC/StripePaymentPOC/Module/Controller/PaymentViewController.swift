//
//  PaymentViewController.swift
//  StripePaymentPOC
//
//  Created by Swetha Sreekanth on 8/11/20.
//  Copyright © 2020 DesiDesign. All rights reserved.
//

import Foundation
import UIKit
import Stripe

class PaymentViewController: UIViewController {

    private var mainView: PaymentView {
        return self.view as! PaymentView
    }
    
    init(){
        super.init(nibName: nil, bundle: Bundle.main)
       }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func loadView() {
        let view = PaymentView()
        view.delegate = self
        self.view = view
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    func showStripePaymentScreen() {
        let theme = STPTheme()
        theme.accentColor = UIColor(named: "Mocha")
        let config = STPPaymentConfiguration()
           let addCardViewController = STPAddCardViewController(configuration: config, theme: theme)
           addCardViewController.delegate = self
            self.navigationController?.pushViewController(addCardViewController, animated: true)
    }
    
}

extension PaymentViewController :STPAddCardViewControllerDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        self.navigationController?.popViewController(animated: false)
    }
    func addCardViewController(_ addCardViewController: STPAddCardViewController,
                               didCreateToken token: STPToken,
                               completion: @escaping STPErrorBlock) {
    }
    
    
}

extension PaymentViewController: ActionDelegate {
    func actionSender(didReceiveAction action: DelegateAction) {
        switch action {
        case PaymentView.Action.ButtonPressed :
           print("Payment button  pressed")
            showStripePaymentScreen()
         default: break
        }
    }
    
    
}
