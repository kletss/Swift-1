//
//  main.swift
//  4l_КлецСергей
//
//  Created by KKK on 25.02.2021.
//

import Foundation


/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
*/


//--------------------------------------------
class Car {
    enum EngineStateENUM: CustomStringConvertible {
        case on, off
        var description: String{
            switch self {
            case .on:
                return "Двигатель заведен!"
            case .off:
                return "Двигатель заглушен"
            }
        }
    }
    enum WindowsStateENUM: CustomStringConvertible {
        case opened, closed
        var description: String{
            switch self {
            case .opened:
                return "Окна открыты!"
            case .closed:
                return "Окна закрыты"
            }
        }
    }
    enum TransmissionENUM: CustomStringConvertible {
        case manual, auto
        var description: String{
            switch self {
            case .manual:
                return "Кробка на ручке"
            case .auto:
                return "Коробка автомат"
            }
        }
    }
    enum hatchStateENUM: CustomStringConvertible {
        case close , open
        var description: String{
            switch self {
            case .open:
                return "Люк открыт!"
            case .close:
                return "Люк закрыт"
            }
        }
    }

    enum ActionCarENUM {
        case switchEngine(EngineStateENUM)
        case switchWindows(WindowsStateENUM)
        case switchHatch(hatchStateENUM)
        case Carge(Double)
        case loadCarge(Double)
        case unloadCarge(Double)
    }
    
    let brand: String
    let year: Int
    let enginePower: Int
    let transmission: TransmissionENUM
    var engineState: EngineStateENUM = .off
    var windowsState: WindowsStateENUM = .closed
    
    func perfom(act: ActionCarENUM) {
        
    }
    
    var decription: String {
        return "Сar ... !?"
    }
    
    init(brand: String, year: Int, enginePower: Int, transmission: TransmissionENUM) {
        self.brand = brand
        self.year = year
        self.enginePower = enginePower
        self.transmission = transmission
    }
}

//----------------------------------------------
final class SportCar: Car {
    var hatchState: hatchStateENUM = .close
    
    override func perfom(act: ActionCarENUM) {
        switch act {
        case .switchEngine(let state):
            self.engineState = state
        case .switchWindows(let state):
            self.windowsState = state
        case .switchHatch(let state):
            self.hatchState = state
        default:
         break
        }
   }
    override var decription: String {
        return "Авто: \(brand), Год выпуска: \(year), \(transmission), Мощность: \(enginePower)л.с.\nСостояние: \(engineState), \(windowsState), \(hatchState)"
    }
//    init(brand: String, year: Int, enginePower: Int, transmission: Car.TransmissionENUM, hatchState: hatchStateENUM) {
//        self.hatchState = hatchState
//        super.init(brand: brand, year: year, enginePower: enginePower, transmission: transmission)
//    }
}
//---------------------------------------
final class TrunkCar: Car {
    var carge: Double
    var loadCarge: Double = 0
    
    override func perfom(act: ActionCarENUM) {
        switch act {
        case .switchEngine(let state):
            self.engineState = state
        case .switchWindows(let state):
            self.windowsState = state
        case .loadCarge(let state):
            self.loadCarge = state
        default:
         break
        }
   }
    override var decription: String {
        return "Авто: \(brand), Год выпуска: \(year), \(transmission), Мощность: \(enginePower)л.с.\nСостояние: \(engineState), \(windowsState), груз: \(loadCarge) из \(carge)"
    }
    init(brand: String, year: Int, enginePower: Int, transmission: TransmissionENUM, carge: Double) {
        self.carge = carge
        super.init(brand: brand, year: year, enginePower: enginePower, transmission: transmission)
    }
}
//-----------------------------
var carS = SportCar(brand: "LOTUS", year: 1980, enginePower: 320, transmission: .manual)
print(carS.decription)
carS.perfom(act: .switchEngine(.on))
carS.perfom(act: .switchHatch(.open))
print(carS.decription)
print("\n")
var carT = TrunkCar(brand: "MAN", year: 2020, enginePower: 120, transmission: .manual, carge: 4000)
print(carT.decription)
carT.perfom(act: .loadCarge(1400))
carT.perfom(act: .switchEngine(.on))
print(carT.decription)
