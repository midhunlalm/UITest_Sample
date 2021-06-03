//
//  HomeController.swift
//  AutomationSample
//
//  Created by Midhunlal on 02/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import UIKit

class HomeController: BaseViewController {
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private var itemList: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupProperties()
    }
}

//MARK: - Private Methods
private extension HomeController {
    func setupInterface() {
        navigationItem.title = "Home"
        navigationItem.hidesBackButton = true
        
        activityIndicatorView.accessibilityLabel = "activityIndicator_View"
        
        tableView.setValue("items_TableView", forKey: "AccessibilityLabel")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
    }
    
    func showActivityIndicator() {
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
    func setupProperties() {
        showActivityIndicator()
        RequestManager.fetchProductList { (result) in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                self.hideActivityIndicator()
                switch result {
                case .success(let response):
                    if let response = response as? [String] {
                        self.itemList = response
                    }
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                    
                case .failure(_):
                    self.showAlert(title: "Error", message: "Something went wrong")
                }
            }
        }
    }
}

//MARK: - Routing
private extension HomeController {
    func showDetailsController(forRow row: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsController") as? DetailsController {
            detailsVC.itemName = itemList?[row]
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

//MARK: - UITableViewDataSource
extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        cell.selectionStyle = .none
        cell.textLabel?.text = itemList?[indexPath.row]
        return cell
    }
}

//MARK: - UITableViewDelegate
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetailsController(forRow: indexPath.row)
    }
}
