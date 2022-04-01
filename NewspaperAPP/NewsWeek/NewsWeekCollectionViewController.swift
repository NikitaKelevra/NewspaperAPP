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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewsWeekViewModel()
//        collectionView.register(NewsWeekCell.self, forCellWithReuseIdentifier: NewsWeekCell.reuseId)
        
        newsWeekCollectionViewLayout()
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }


    // MARK: - UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsWeekCell.reuseId, for: indexPath)
        
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
    
    private func newsWeekCollectionViewLayout() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.itemSize = CGSize(
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 1
        let paddingWitdth = 0 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWitdth
        let widthPerItem = availableWidth / itemsPerRow
        
//        let string = viewModel.cellViewModel(at: indexPath).title
//        let heightOfTitle = string.height(constraintedWidth: widthPerItem, font: UIFont.systemFont(ofSize: 15))
//        let heightOfImage = viewModel.cellViewModel(at: indexPath).imageData
//        let heightPerItem = heightOfTitle + heightOfImage
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
    
}

//extension String {
//func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
//    let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
//    label.numberOfLines = 0
//    label.text = self
//    label.font = font
//    label.sizeToFit()
//
//    return label.frame.height
// }
//}
