//
//  Copying.swift
//  XO_Game
//
//  Created by Зинде Иван on 11/12/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation

protocol Copying: AnyObject {
    init(_ prototype: Self)
}

extension Copying where Self: AnyObject {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}
