//
//  ViewController.swift
//  coffee
//
//  Created by Зинде Иван on 11/19/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

import UIKit
//Класс контроллер экрана кофе
class CoffeeViewController: UIViewController {
    @IBOutlet private weak var sugarButton: UIButton!
    @IBOutlet private weak var milkButton: UIButton!
    @IBOutlet private weak var whipButton: UIButton!
    @IBOutlet private weak var cinnamonButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    //Свойство - словарь доступных ингредиентов
    private var ingredients : [String:Bool] = ["sugar":false, "milk": false, "whip" : false, "cinnamon" : false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    @IBAction func makeCoffe(_ sender: Any) {
        makeCoffe()
    }
    
    @IBAction func sugarButtonPressed(_ sender: Any) {
        sugarButton.isSelected.toggle()
    }
    
    @IBAction func milkButtonPressed(_ sender: Any) {
        milkButton.isSelected.toggle()
    }
    
    @IBAction func whipButtonPressed(_ sender: Any) {
        whipButton.isSelected.toggle()
    }
    
    @IBAction func cinnamonButtonPressed(_ sender: Any) {
        cinnamonButton.isSelected.toggle()
    }
    
    //Метод начального конфигурирования элементов UI
    private func configureUI(){
        sugarButton.setImage(UIImage(named: "sugar_icon"), for: .normal)
        sugarButton.setImage(UIImage(named: "sugar_icon_pressed"), for: .selected)
        milkButton.setImage(UIImage(named: "milk_icon"), for: .normal)
        milkButton.setImage(UIImage(named: "milk_icon_pressed"), for: .selected)
        whipButton.setImage(UIImage(named: "whip_icon"), for: .normal)
        whipButton.setImage(UIImage(named: "whip_icon_pressed"), for: .selected)
        cinnamonButton.setImage(UIImage(named: "cinnamon_icon"), for: .normal)
        cinnamonButton.setImage(UIImage(named: "cinnamon_icon_pressed"), for: .selected)
        resultLabel.text = ""
    }
    //Метод обновления ингредиентов согласно UI
    private func updateIngredientsFromUI() {
        ingredients["sugar"] = sugarButton.isSelected
        ingredients["milk"] = milkButton.isSelected
        ingredients["whip"] = whipButton.isSelected
        ingredients["cinnamon"] = cinnamonButton.isSelected
    }
    //Метод создания кофе
    private func makeCoffe(){
        updateIngredientsFromUI()
        let coffee = chekIngredients(baseCoffee: SimpleCoffee())
        resultLabel.text = "Total coffee coast : \(coffee.cost)$"
    }
    
    //Рекурсивный метод проверки ингредиентов для кофе
    private func chekIngredients (baseCoffee : Coffee) -> Coffee {
        if ingredients["sugar"] ?? false {
            ingredients["sugar"] = false
            return chekIngredients (baseCoffee : addIngredient(baseCoffee: baseCoffee, decorator: Sugar.self))
        } else if ingredients["milk"] ?? false {
            ingredients["milk"] = false
            return chekIngredients (baseCoffee : addIngredient(baseCoffee: baseCoffee, decorator: Milk.self))
        } else if ingredients["whip"] ?? false {
            ingredients["whip"] = false
            return chekIngredients (baseCoffee : addIngredient(baseCoffee: baseCoffee, decorator: Whip.self))
        } else if ingredients["cinnamon"] ?? false {
            ingredients["cinnamon"] = false
            return chekIngredients (baseCoffee : addIngredient(baseCoffee: baseCoffee, decorator: Cinnamon.self))
        } else {
            return baseCoffee
        }
    }
    //Метод добавления ингредиентов в кофе
    private func addIngredient<T:CoffeeDecorator>(baseCoffee: Coffee, decorator : T.Type) -> Coffee {
        return T(base: baseCoffee)
    }
}

