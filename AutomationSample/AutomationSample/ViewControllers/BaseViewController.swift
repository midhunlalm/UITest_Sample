//
//  BaseViewController.swift
//  AutomationSample
//
//  Created by Midhunlal on 08/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController {
    func showAlert(title: String?, message: String?) {
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
}
