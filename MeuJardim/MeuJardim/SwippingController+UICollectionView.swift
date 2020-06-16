//
//  SwippingController+UICollectionView.swift
//  MeuJardim
//
//  Created by Ana Karolina Costa da Silva on 13/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

extension SwippingController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return pages.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
            
            let page = pages[indexPath.item]
            cell.page = page
    //        cell.profileImageView.image = UIImage(named: page.imageName)
    //        cell.headerTextView.text = page.headerText
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }
}
