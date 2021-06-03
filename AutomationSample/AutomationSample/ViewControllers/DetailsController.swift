//
//  DetailsController.swift
//  AutomationSample
//
//  Created by Midhunlal on 02/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import UIKit

class DetailsController: BaseViewController {
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    var itemName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
}

//MARK: - Private Methods
private extension DetailsController {
    func setupInterface() {
        navigationItem.title = "Details"
        navigationItem.hidesBackButton = false
        
        itemTitleLabel.text = itemName
    }
}
