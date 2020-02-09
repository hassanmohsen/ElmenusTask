//
//  TagListViewController.swift
//  ElmenusTask
//
//  Created by Hassan on 2/6/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit

class TagListViewController: UIViewController {

    
    @IBOutlet weak var tagsListCollection: UICollectionView!
    
    var tagesDataSource = [TagModel]()
    var tagPresenter : TagesPresenterProtocol!
    

    init(presenter : TagesPresenterProtocol) {
        super.init(nibName: String.init(describing: TagListViewController.self), bundle: nil)
        self.tagPresenter = presenter
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.establishCollectionView()
        tagPresenter.setDelegator(viewController: self)
        tagPresenter.getTagesList()
        
    }

    override func viewWillAppear(_ animated: Bool) {
//        self.view.setGradientBackground(colorTop: AppColors.tagesListBGTopGradient,
//                                        colorBottom: AppColors.tagesListBGbottomGradient)
        self.view.backgroundColor = AppColors.tagesBGColor
    }

    private func establishCollectionView() -> Void {
        
        tagsListCollection.register(TagesListCell.self, forCellWithReuseIdentifier: TagesListCell.identifier)
        tagsListCollection.dataSource = self
        tagsListCollection.delegate   = self
        
    }

}

extension TagListViewController : UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagesDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagesListCell.identifier, for: indexPath ) as! TagesListCell
        
        let tagModel = tagesDataSource[indexPath.item]
        cell.configureCell(tagModel: tagModel)
        
        return cell
    }
    
    
    
}

extension TagListViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTag = tagesDataSource[indexPath.item]
        if let itemTitle = selectedTag.tagName {
            let itemsListVC = ItemsListViewController.init(itemPresenter: ItemsListPresenter.init(apiService: APISMAnager(),
                                                                                                  withTag: itemTitle))
            let itemsNav = UINavigationController.init(rootViewController: itemsListVC)
            present(itemsNav, animated: true, completion: nil)
        }
        
    }
}




extension TagListViewController : TagesPresenterResponseProtocol {
    func successResponse(withTages tages: [TagModel]) {
        self.tagesDataSource.append(contentsOf: tages)
        self.tagsListCollection.reloadData()
    }
    
    func failureResponse(withError error: Error) {
        print(error)
    }
    
    
}


extension TagListViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width

        if offsetX > contentWidth - scrollView.frame.width {
            self.tagPresenter.getTagesList()
        }


    }
}
