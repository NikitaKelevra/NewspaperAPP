//
//  NewsWeekCollectionViewController.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import UIKit


class NewsWeekCollectionViewController: UICollectionViewController {

    var viewModel: NewsWeekCollectionViewModelProtocol! {
        didSet {
            viewModel.fetchNews {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    private let reuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewsWeekViewModel()

        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }


    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        guard let newsWeekCell = cell as? NewsWeekCell else { return cell }
        
        newsWeekCell.viewModel = viewModel.cellViewModel(at: indexPath)
    
        return newsWeekCell
    }

    // MARK: - UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

// MARK: - UICollectionViewDelegateFlowLayout
extension NewsWeekCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 1
        let paddingWitdth = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWitdth
        let widthPerItem = availableWidth / itemsPerRow
        
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
}
