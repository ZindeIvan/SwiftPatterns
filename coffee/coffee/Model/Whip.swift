//
//  Whip.swift
//  coffee
//
//  Created by Зинде Иван on 11/20/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Класс декоратор кофе с увеличением базовой стоимости
class Whip : CoffeeDecorator {
    
    var baseCoffee: Coffee
    
    var cost: Double {
        return baseCoffee.cost + 1.5
    }
    
    required init(base: Coffee) {
        self.baseCoffee = base
    }
}
