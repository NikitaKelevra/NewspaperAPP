//
//  NewsWeekCollectionViewController.swift
//  NewspaperAPP
//
//  Created by Сперанский Никита on 26.03.2022.
//

import UIKit


class NewsWeekCollectionViewController: UICollectionViewController {

    // MARK: - Public properties
    var viewModel: NewsWeekCollectionViewModelProtocol! {
        didSet {
            viewModel.fetchNews {
                self.collectionView.reloadData()
            }
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private var reuseId: String = "cell"
    
    // MARK: - override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(NewsWeekCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        viewModel = NewsWeekViewModel()
        newsWeekCollectionViewLayout()
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "ShowDetails" {
//            let detailsVC = segue.destination as! DetailsViewController
//            detailsVC.viewModel = sender as? DetailsViewModelProtocol
//        }
    }


    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseId, for: indexPath)
        
        guard let newsWeekCell = cell as? NewsWeekCell else { return cell }
        
        newsWeekCell.viewModel = viewModel.cellViewModel(at: indexPath)
    
        return newsWeekCell
    }

    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
//        let detailsViewModel = viewModel.detailsViewModel(at: indexPath)
//        performSegue(withIdentifier: "ShowDetails", sender: detailsViewModel)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsVC = storyboard.instantiateViewController(withIdentifier: "ShowDetails") as? DetailsViewController else { return }
        
        show(detailsVC, sender: nil)
    }
    
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

        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        
//        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        flowLayout.itemSize = CGSizeMake(100, 100);
//        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
//        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        

//        layout.itemSize = CGSize(width: widthOfItem(), height: widthOfItem())
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.estimatedItemSize.width = widthOfItem()
        
        
    }
    
    private func widthOfItem() -> CGFloat {
        let itemsPerRow: CGFloat = 1
//        let paddingWitdth = 0 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width
        let widthPerItem = availableWidth / itemsPerRow
        return widthPerItem
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {


        return CGSize(width: self.widthOfItem(), height: self.widthOfItem())
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
