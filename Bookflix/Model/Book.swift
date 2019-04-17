//
//  Book.swift
//  Bookflix
//
//  Created by SEO on 16/04/2019.
//  Copyright © 2019 SEO. All rights reserved.
//

import UIKit

class Book: NSObject {
    var title: String?
    var thumbnailImageName: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var library: Library?
}

class Library: NSObject {
    var name: String?
    var profileImageName: String?
}
