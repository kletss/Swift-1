//
//  main.swift
//  3l_КлецСергей
//
//  Created by KKK on 20.02.2021.
//

import Foundation

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
*/


enum windowsStateENUM: String {
    case close = "Закрыты" , open = "Открыты"
}
enum engineStateENUM: String {
    case start = "Работает", stop = "Не работает"
}
//enum TrunkStatedENUM: String {
//    case empty = "Пустой", half = "Половина", fill = "Полный"
//}
//enum carTypeENUM: String{
//    case sportCar = "спорткар", trunkCar = "грузовик"
//}
struct SportCar {
    //let carType: carTypeENUM
    let brend: BrendENUM
    let year: Int
    let enginePower: Int
    var engineState: engineStateENUM {
        willSet {
            let ews = newValue == .start ? "Ща запустим двигатель" : "Ща заглушим двигатель"
            print(ews)
        }
        didSet {
            let eds = oldValue == .stop ? "Двигатель работает" : "Двигатель не работает"
            print(eds)
        }
    }
    
    var windowsState: windowsStateENUM {
        willSet {
            let wws = newValue == .open ? "Ща опустим окна" : "Ща закроем окна"
            print(wws)
        }
        didSet {
            let wds = oldValue == .close ? "Окна открыты" : "Окна закрыты"
            print(wds)
        }
    }
    
    enum BrendENUM {
        case Jaguar
        case Ferrari
        case Bugatti
        case Porche
        case Lotus //(year: Int = 1987, power: Int =  520, acceleration: Double = 9.2 )
    }

   mutating func action(devices: actionDevicesSportCar) {
        switch devices {
        case .engine(state: let state):
            self.engineState = state
        case .windows(state: let state):
            self.windowsState = state
        //default:
        //    break
        }
   }
    
    init(brend: BrendENUM, year: Int, enginePower: Int) {
        //self.carType = .sportCar
        self.brend = brend
        self.year = year
        self.enginePower = enginePower
        self.engineState = .stop
        self.windowsState = .close
    }

}

struct TrunkCar {
    //let carType: carTypeENUM
    let brend: BrendENUM
    let year: Int
    let trunkVolume : Int
    var trunkFill :Int
    var engineState: engineStateENUM {
        willSet {
            let ews = newValue == .start ? "Ща запустим двигатель" : "Ща заглушим двигатель"
            print(ews)
        }
        didSet {
            let eds = oldValue == .stop ? "Двигатель работает" : "Двигатель не работает"
            print(eds)
        }
    }
    var windowsState: windowsStateENUM {
        willSet {
            let wws = newValue == .open ? "Ща опустим окна" : "Ща закроем окна"
            print(wws)
        }
        didSet {
            let wds = oldValue == .close ? "Окна открыты" : "Окна закрыты"
            print(wds)
        }
    }
    
    enum BrendENUM {
        case MAN
        case Volvo
        case Kamaz
    }

   mutating func action(devices: actionDevicesTrunkCar) {
        switch devices {
        case .engine(state: let state):
            self.engineState = state
        case .windows(state: let state):
            self.windowsState = state
        case .load(tval: let tval):
            print("Cейчас занятый объем = \(self.trunkFill), необходимо покрузить объем = \(tval)")
            if self.trunkFill + tval <= self.trunkVolume {
            self.trunkFill += tval
            } else {
                print("Груз объемом =\(tval) загрузить не возможно, это будет свыше всего объема кузова \(self.trunkVolume)")
            }
        case .unload(tval: let tval):
            print("Cейчас занятый объем = \(self.trunkFill), разгружаем \(tval)")
            if self.trunkFill - tval > 0 {
            self.trunkFill -= tval
            } else {
                print("Такого объема груза нет, есть \(self.trunkFill)")
            }
        //default:
        //    break
        }
   }
    
    init(brend: BrendENUM, year: Int, trunkVolume: Int) {
        //self.carType = .trunkCar
        self.brend = brend
        self.year = year
        self.trunkVolume = trunkVolume
        self.trunkFill = 0
        //self.trunkState = .empty
        self.engineState = .stop
        self.windowsState = .close
    }
    
}

enum actionDevicesSportCar {
    case engine(state: engineStateENUM)
    case windows(state: windowsStateENUM)
   }

enum actionDevicesTrunkCar {
    case engine(state: engineStateENUM)
    case windows(state: windowsStateENUM)
    case load(tval: Int)
    case unload(tval: Int)
   }

func printSportCar(_ car:SportCar) {
    print("\nбренд:\(car.brend),\nгод выпуска:\(car.year),\nокна:\(car.windowsState.rawValue),\nдвигатель:\(car.engineState.rawValue)\n")
}
func printstatusSportCar(_ car:SportCar) {
    print("\nСтатус авто:\nокна:\(car.windowsState.rawValue), двигатель:\(car.engineState.rawValue)\n")
}

func printTrunkCar(_ car:TrunkCar) {
    print("\nбренд:\(car.brend),\nгод выпуска:\(car.year),\nокна:\(car.windowsState.rawValue),\nдвигатель:\(car.engineState.rawValue)\nгрузоподъемность:\(car.trunkVolume)\n")
}
func printStatusTrunkCar(_ car:TrunkCar) {
    print("\nСтатус авто:\nокна:\(car.windowsState.rawValue), двигатель:\(car.engineState.rawValue), груз: \(car.trunkFill)кубов\n")
}

var scar = SportCar(brend: .Lotus, year: 2001, enginePower: 520)
print("---> Тестим спорткар")
printSportCar(scar)
scar.action(devices: .engine(state: .start))
scar.action(devices: .windows(state: .open))
scar.action(devices: .windows(state: .close))
scar.action(devices: .engine(state: .stop))
printstatusSportCar(scar)

var tcar = TrunkCar(brend: .MAN, year: 2001, trunkVolume: 3000)
print("---> Тестим грузовик")
printTrunkCar(tcar)
tcar.action(devices: .load(tval: 1000))
tcar.action(devices: .load(tval: 2000))
tcar.action(devices: .load(tval: 100))
tcar.action(devices: .unload(tval: 900))
tcar.action(devices: .engine(state: .start))
tcar.action(devices: .engine(state: .stop))
printStatusTrunkCar(tcar)

