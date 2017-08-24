//
//  ItemCollectionVC.swift
//  Overpower
//
//  Created by Bright Future on 14/10/2016.
//  Copyright © 2016 Bright Future. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

public enum DataSourceType {
    case items
    case heros
}

class PopoverCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var delegate: PopoverCollectionViewDelegate?
    var dataSourceItems: [Selectable] {
        switch dataSourceType {
        case .items:
            return LocalItem.allItems + [LocalItem.emptyItem]
        case .heros:
            return LocalHero.allHeroes
        }
    }
    var dataSourceType: DataSourceType = .heros
    let edgeInset: CGFloat = 20
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        let data = dataSourceItems[indexPath.item]
        cell.cellImage.image = data.image

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = dataSourceItems[indexPath.row]
        delegate?.get(object: selectedItem)
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK:- Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: edgeInset + 10, left: edgeInset, bottom: 2, right: edgeInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionWidth = collectionView.bounds.width - edgeInset * 2
        switch dataSourceType {
        case .heros:
            return CGSize(width: (collectionWidth - 3) / 4, height: (collectionWidth - 3) / 4)
        case .items:
            return CGSize(width: (collectionWidth - 20) / 6, height: (collectionWidth - 20) / 6)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        switch dataSourceType {
        case .heros:
            return 1
        case .items:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch dataSourceType {
        case .heros:
            return 1
        case .items:
            return 4
        }
    }
}

protocol PopoverCollectionViewDelegate {
    func get(object: Selectable)
}

