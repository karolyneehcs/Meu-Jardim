//
//  SwipingController.swift
//  MeuJardim
//
//  Created by Ana Karolina Costa da Silva on 11/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(imageName: "onboarding1", headerText: "Vamos te ajudar a cuidar das suas plantas!", bodyText: "Te fornecemos todas as informações para suas plantinhas"),
        Page(imageName: "onboarding2", headerText: "Você pode identificar sua plantinha", bodyText: "temos uma aba de reconhecimento de imagens, então identificar sua plantinha não vai ser um problema"),
        Page(imageName: "onboarding3", headerText: "Tornamos a experiência de jardinagem melhor", bodyText: "Aqui voce pode inserir suas plantas e monitorá-las de acordo com suas características")
    ]
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("VOLTAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        
        
        return button
    }()
    
    @objc private func handlePrev() {
        print("Trying to previous")
        
        let lastIndex = max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: lastIndex, section: 0)
        pageControl.currentPage = lastIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PRÓXIMO", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handleNext() {
        print("trying to advance to next")
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        if pageControl.currentPage == pages.count-1{
            let storyboard = UIStoryboard(name: "InitialView", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "InitialView") as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else{
            let indexPath = IndexPath(item: nextIndex, section: 0)
            pageControl.currentPage = nextIndex
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainGreen
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()
    
    fileprivate func setupBottomControls(){
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        
        
        setupBottomControls()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
}
