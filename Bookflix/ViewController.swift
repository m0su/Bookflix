//
//  ViewController.swift
//  Bookflix
//
//  Created by SEO on 08/04/2019.
//  Copyright © 2019 SEO. All rights reserved.
//

import UIKit

let title = "Bookflix"

class ViewController: UIViewController {

    var mainViewController = UIViewController()
    var collectionViewController = UICollectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initMainViewController()
    }
    
    // msseo 190408 MainView = collectionView
    func initMainViewController() {
        mainViewController.title = title
//        mainViewController.view.backgroundColor =  UIColor.red
        self.view.addSubview(mainViewController.view)
        
        let rect = CGRect(x: 20, y: 100, width: 300, height: 100)
        let label = UILabel(frame: rect)
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        
        mainViewController.view.addSubview(label)
    }
    
    func addCollectionView() {
        
        collectionViewController.view.backgroundColor = UIColor.blue
        mainViewController.view.addSubview(collectionViewController.view)
    }


}

