//
//  SwippingController+extension.swift
//  MeuJardim
//
//  Created by Ana Karolina Costa da Silva on 13/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

extension SwippingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           coordinator.animate(alongsideTransition:  { (_) in
               self.collectionViewLayout.invalidateLayout()
               
               
               if self.pageControl.currentPage == 0 {
                   self.collectionView?.contentOffset = .zero
               } else {
                   let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                   self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
               }
               
           } , completion: {(_) in })
           
       }
}
