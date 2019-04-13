//
//  HeaderView.swift
//  Bookflix
//
//  Created by SEO on 13/04/2019.
//  Copyright © 2019 SEO. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .purple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
