//
//  main.swift
//  5l_КлецСергей
//
//  Created by KKK on 01.03.2021.
//
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль.

*/
import Foundation

enum VehicleType: CustomStringConvertible {
    case sportCar, tankCar
    var description: String{
        switch self {
        case .sportCar:
            return "Сторткар"
        case .tankCar:
            return "Цистерна"
        }
    }
}
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
enum HatchStateENUM: CustomStringConvertible {
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
enum WindowsStateENUM: CustomStringConvertible {
    case opened, closed
    var description: String {
        switch self {
        case .opened:
            return "Окна открыты!"
        case .closed:
            return "Окна закрыты"
        }
    }
}
enum WipersStateENUM: CustomStringConvertible {
    case on, off
    var description: String {
        switch self {
        case .on:
            return "Дворники работают!"
        case .off:
            return "Дворники выключены"
        }
    }
}

///----------------
protocol Car {
    var type: VehicleType {get}
    var brand: String {get set}
    var year: Int {get set}
    var enginePower: Int {get set}
    var windowsState: WindowsStateENUM {get set}
    var engineState: EngineStateENUM {get set}
    var wipersState: WipersStateENUM {get set}
    
    func all_OFF_Close()
}

extension Car {
    mutating func stopEngine()   {self.engineState = .off}
    mutating func startEngine()  {self.engineState = .on}
    mutating func closeWindows() {self.windowsState = .closed}
    mutating func openWindows()  {self.windowsState = .opened}
    mutating func stopWipers()   {self.wipersState = .off}
    mutating func startWipers()  {self.wipersState = .on}
}
//--------------------------------
class SportCar: Car {
    var type: VehicleType = .sportCar
    var brand: String
    var year: Int
    var enginePower: Int
    var windowsState: WindowsStateENUM = .closed
    var engineState: EngineStateENUM = .off
    var wipersState: WipersStateENUM = .off
    //-- новое свойство --
    var hatchState: HatchStateENUM = .close
    //--------------------
    
    func all_OFF_Close() {
        self.engineState = .off
        self.windowsState = .closed
        self.wipersState = .off
        //self.hatchState = .close
        closeHatch()
    }
    
    init(brand: String, year: Int, enginePower: Int) {
        self.brand = brand
        self.year = year
        self.enginePower = enginePower
    }
    
}
extension SportCar {
    func openHatch()  {self.hatchState = .open}
    func closeHatch() {self.hatchState = .close}
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return("\(type) \(brand), Год выпуска: \(year),  Мощность: \(enginePower)л.с.\nСостояние: \(engineState), \(windowsState), \(hatchState), \(wipersState)\n")
    }
}
//--------------------------------
class TankCar: Car {
    var type: VehicleType = .tankCar
    var brand: String
    var year: Int
    var enginePower: Int
    var windowsState: WindowsStateENUM = .closed
    var engineState: EngineStateENUM = .off
    var wipersState: WipersStateENUM = .off
    //-- новое свойство --
    var maxCargo: Double
    var curCargo: Double = 0
    //--------------------
    
    func all_OFF_Close() {
        self.engineState = .off
        self.windowsState = .closed
        self.wipersState = .off
        unloadCargo(unload: curCargo)
    }
    
    init(brand: String, year: Int, enginePower: Int, maxCargo: Double) {
        self.brand = brand
        self.year = year
        self.enginePower = enginePower
        self.maxCargo = maxCargo
    }
    
}
extension TankCar {
    func loadCargo(load : Double)  {
        let expC = curCargo + load
        switch expC {
        case _ where expC > maxCargo:
            break
        default:
            curCargo += load
        }
        
    }
    func unloadCargo(unload : Double) {
        let expC = curCargo - unload
        switch expC {
        case _ where expC < 0:
            break
        default:
            curCargo -= unload
        }
    }
}
extension TankCar: CustomStringConvertible {
    var description: String {
        return("\(type) \(brand), Год выпуска: \(year),  Мощность: \(enginePower)л.с.\nСостояние: \(engineState), \(windowsState), \(wipersState), загрука \(curCargo) из \(maxCargo)\n")
    }
}

//----------------------------------------
var carFord = SportCar(brand: "Ford", year: 2021, enginePower: 250)
print(carFord)
carFord.startEngine()
carFord.openWindows()
carFord.openHatch()
carFord.startWipers()
print(carFord)
carFord.all_OFF_Close()
print(carFord)

var carMAN = TankCar(brand: "MAN", year: 2002, enginePower: 180, maxCargo: 5000)
print(carMAN)
carMAN.loadCargo(load: 1320.5)
carMAN.startEngine()
carMAN.openWindows()
print(carMAN)
carMAN.all_OFF_Close()
print(carMAN)

