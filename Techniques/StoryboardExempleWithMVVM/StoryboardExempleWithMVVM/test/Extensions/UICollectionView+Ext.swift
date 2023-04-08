//
//  UICollectionView+Ext.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 9.04.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
