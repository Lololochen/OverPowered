//
//  ConversationVC.swift
//  OverPowered
//
//  Created by Bright Future on 26/02/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class ConversationVC: UICollectionViewController {
    
    let interItemSpacing: CGFloat = 30
    var cellWidth: CGFloat {
        let horizontalClass = traitCollection.horizontalSizeClass
        if horizontalClass == .compact {
            return view.bounds.width
        } else {
            return DialogView.cellWidthOnIpad
        }
    }

    @IBOutlet weak var naviItem: UINavigationItem!
    @IBOutlet weak var restartButton: UIBarButtonItem!
    
    var viewModel: ConversationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ConversationViewModel(router: Router.shared, conversationVC: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.conversationContent.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ConversationCell
    
        let dialogView = viewModel.conversationContent[indexPath.row]
        cell.dialogView = dialogView
        
        return cell
    }
    
    func presentPopover(sender: UIView, dataSourceType: DataSourceType) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "PopoverCollectionVC") as! PopoverCollectionVC
        destinationVC.dataSourceType = dataSourceType
        destinationVC.delegate = viewModel
        destinationVC.modalPresentationStyle = .popover
        destinationVC.popoverPresentationController?.sourceView = sender
        destinationVC.popoverPresentationController?.sourceRect = sender.bounds
        
        present(destinationVC, animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        for view in viewModel.conversationContent {
            view.superViewWidth = cellWidth
        }
    }
    
    func contentNeedsUpdate() {
        UIView.transition(with: collectionView!, duration: 0.2, options: .transitionCrossDissolve, animations: { () -> Void in
            
            self.collectionView!.reloadData()
        }, completion: nil)
    }

}

extension ConversationVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let viewForCell = viewModel.conversationContent[indexPath.row]
        return CGSize(width: cellWidth, height: viewForCell.bounds.height + 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let horizontalClass = traitCollection.horizontalSizeClass
        if horizontalClass == .compact {
            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
            
        } else {
            let numberOfCellsInARow = Int(collectionView.bounds.width / cellWidth)
            let totalCellWidth = CGFloat(numberOfCellsInARow) * cellWidth
            let totalInterItemSpacing = CGFloat(numberOfCellsInARow - 1) * interItemSpacing
            let inset = (collectionView.bounds.width - totalCellWidth - totalInterItemSpacing) / 2
            return UIEdgeInsets(top: 10, left: inset, bottom: 0, right: inset)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
}
