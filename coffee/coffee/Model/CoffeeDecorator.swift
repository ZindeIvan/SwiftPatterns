//
//  CoffeDecorator.swift
//  coffee
//
//  Created by Зинде Иван on 11/20/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import Foundation
//Протокол - декоратор для кофе
protocol CoffeeDecorator : Coffee {
    var baseCoffee : Coffee {get}
    init(base: Coffee)
}
