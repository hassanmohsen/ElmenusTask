//
//  ItemsListViewController.swift
//  ElmenusTask
//
//  Created by Hassan on 2/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit
import Hero
class ItemsListViewController: UIViewController {

    
    @IBOutlet weak var tblItemsList: UITableView!
    private var itemsDataSource = [ItemModel]()
    private var itemPresenter : ItemsListPresenterProtocol!
    
    
    
    init(itemPresenter : ItemsListPresenterProtocol) {
        super.init(nibName: String.init(describing: ItemsListViewController.self), bundle: nil)
        self.itemPresenter = itemPresenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        establishItemsListTable()
        setupBackNavigationButton()
        
        self.itemPresenter.setDelegator(delegator: self)
        self.itemPresenter.getItemsList()
    }
    
    private func setupBackNavigationButton() -> Void {
        
        let backButton = UIBarButtonItem.init(title: "Back", style: .plain, target: self, action: #selector(backButtonAction))
        self.navigationItem.leftBarButtonItem = backButton
    }
    @objc private func backButtonAction() -> Void {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    private func establishItemsListTable() -> Void {
        tblItemsList.register(ItemsListCustomCell.nibCell, forCellReuseIdentifier: ItemsListCustomCell.identifier)
        tblItemsList.separatorStyle = .none
        tblItemsList.rowHeight = 90.0
        tblItemsList.backgroundColor = .clear
        tblItemsList.delegate   = self
        tblItemsList.dataSource = self
    }


   
}


extension ItemsListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemsDataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemsListCustomCell.identifier, for: indexPath) as! ItemsListCustomCell
        
        let item = itemsDataSource[indexPath.section]
        cell.configure(item: item)
        
        return cell
    }
    
    
}


extension ItemsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = itemsDataSource[indexPath.section]
        let itemDetailVC = ItemDetailsViewController.init(itemDetails: selectedItem)
        itemDetailVC.hero.isEnabled = true
        present(itemDetailVC, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
}



extension ItemsListViewController : ItemsListResponceProtocol {
    func successResponse(withItems items: [ItemModel]) {
        self.itemsDataSource = items
        self.tblItemsList.reloadData()
    }
    
    
    func failureResponse(withError error: Error) {
        print(error)
    }
    
    
}
