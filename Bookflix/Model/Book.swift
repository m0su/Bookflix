//
//  Book.swift
//  Bookflix
//
//  Created by SEO on 16/04/2019.
//  Copyright © 2019 SEO. All rights reserved.
//

import UIKit

class Book: Decodable {
    
    var title, subtitle, isbn13, price: String?
    var imageURL: String?
    var url: String?
    
//    var library: BookListFromJSON?
    
//    required init(from decoder: Decoder) throws {
//    
//    }
}

class BookListFromJSON: Decodable {
    var error, total: String?
    var books: [Book]?
}
