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
    
    var books: [Book] = {
        var myLibrary = Library()
        myLibrary.name = "Bestlibrary"
        myLibrary.profileImageName = "star_1280"
        
        var blankSpacebook = Book()
        blankSpacebook.title = "스위프트 따라잡기"
        blankSpacebook.thumbnailImageName = "book_1920"
        blankSpacebook.library = myLibrary
        blankSpacebook.numberOfViews = 12312321231232
        
        var badBloodBook = Book()
        badBloodBook.title = "Objective-C와 Swift의 차이점을 알아봅시다."
        badBloodBook.thumbnailImageName = " book_1920"
        badBloodBook.library = myLibrary
        badBloodBook.numberOfViews = 321321
        
        return [blankSpacebook, badBloodBook]
    } ()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // collectionView
        navigationItem.title = "Bookflix"
        navigationController?.navigationBar.isTranslucent = false // 투명도 삭제
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Back"
        titleLabel.textColor = .white
        
        collectionView?.backgroundColor = .white
        collectionView?.register(BookCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
//        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
//        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
//        
//        let moreButton = UIBarButtonItem(image: UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleMore))
        let play = UIBarButtonItem(title: "Q", style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.rightBarButtonItems = [add, play]
//        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    
    @objc func handleSearch() {
        print(123)
    }
    
    @objc func handleMore() {
        print(1234)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BookCell
        
        cell.book = books[indexPath.item]
        
//        cell.backgroundColor = UIColor.red
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width , height:height + 16 + 88) // 68: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|"
    }
}
