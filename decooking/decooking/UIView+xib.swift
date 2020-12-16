//
//  UIView+xib.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import UIKit

extension UIView {
    static func loadXib<T>() -> T {
        let name =  String(describing: self)
        guard let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T else {
            fatalError("Could not load view with type \(name)")
        }
        return view
    }
}

//extension UIScrollView {
//    static func loadXib<T>() -> T {
//        let name =  String(describing: self)
//        guard let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T else {
//            fatalError("Could not load view with type \(name)")
//        }
//        return view
//    }
//}
