//
//  ViewController.swift
//  Bookflix
//
//  Created by SEO on 08/04/2019.
//  Copyright © 2019 SEO. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    struct Book {
        var title = String()
        var price = String()
    }
    
    var books = [Book(title: "스위프트 따라잡기", price: "10,000"),
                 Book(title: "iOS 따라잡기", price: "20,000"),
                 Book(title: "Objective-C 따라잡기", price: "15,000"),
                 Book(title: "Xcode 따라잡기", price: "16,000"),
                 Book(title: "AppStore 따라잡기", price: "18,000")]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // collectionView
        navigationItem.title = "Bookflix"
        navigationController?.navigationBar.isTranslucent = false // 투명도 삭제
        
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
//        navigationItem.titleView = titleLabel
//        titleLabel.text = "Back"
//        titleLabel.textColor = .white
        
        collectionView?.backgroundColor = .white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setupMenuBar()
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    } ()
    
    // no other class should actually have access to this setup function.
    private func setupMenuBar() {
        view.addSubview(menuBar)
        
        // 아래 설정을 하지 않으면 보이지 않음
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(44)]|", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
//        cell.backgroundColor = UIColor.red
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width , height:height + 16 + 68) // 68: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|"
    }
}
