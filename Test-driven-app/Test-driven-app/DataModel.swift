//
//  Test_driven_appApp.swift
//  Test-driven-app
//
//  Created by Kate on 10/01/2024.
//

import SwiftUI

struct DataModel {
    /// Уровень громкости
    private(set) var volume = 0
    // private(set) - у переменной теперь есть только get, свойство может быть установлено только в пределах кода, который является частью структуры
    
    /// метод который будет задавать новую громкость
    mutating func setVolume(with value: Int) {
//        volume = value
//        let maxVal = max(0, value)
//        let valueNew = min(100, maxVal)
//        volume = valueNew
        volume = min(max(0, value), 100)
    }
    
    /// true если 1-ый > 2-ого
    func greaterThanValue(x: Int, y: Int) -> Bool {
        x > y
    }

    /// true если кратно 3 / isMultiple
    func isDivisibleByThree(number: Int) -> Bool {
//        number % 3 == 0
        number.isMultiple(of: 3)
        
    }
}
