//
//  ViewController.swift
//  StripePaymentPOC
//
//  Created by Swetha Sreekanth on 8/11/20.
//  Copyright © 2020 DesiDesign. All rights reserved.
//

import UIKit
import Stripe

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        let theme = STPTheme()
        theme.accentColor = UIColor(named: "Mocha")
        let config = STPPaymentConfiguration()
           let addCardViewController = STPAddCardViewController(configuration: config, theme: theme)
           addCardViewController.delegate = self
            self.navigationController?.pushViewController(addCardViewController, animated: true)
        //}
    }
    
}

extension ViewController :STPAddCardViewControllerDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        print("addCardViewControllerDidCancel :::")
        self.navigationController?.popViewController(animated: false)
    }
    
    
}

