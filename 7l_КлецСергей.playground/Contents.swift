//
//  main.swift
//  7l_КлецСергей
//
//  Created by KKK on 11.03.2021.
//
/*
1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
*/


import Foundation

struct ItemCar{
    var price: Int
    var count: Int
}
class CollectionCarGuard {
    var car = [
        "LEXUS": ItemCar(price: 3_800_000, count: 3),
        "MAZDA": ItemCar(price: 2_500_000, count: 0),
        "MAN": ItemCar(price: 5_300_000, count: 1)
    ]
    
    
    func buyCar(nameCar name: String, conisUser:Int)  -> String {
        guard let item = car[name] else {
            return "машины \(name) нет"
        }
        guard item.count > 0 else {
            return "такого количества машины \(name) нет"
        }
        guard item.price <= conisUser else {
            return "стоимостью \(conisUser) машины \(name) нет"
        }
    return "Ура купили машину \(name) за \(item.price)"
    }
}
//----
print(CollectionCarGuard().buyCar(nameCar: "MAN", conisUser: 3_800_100))

print(CollectionCarGuard().buyCar(nameCar: "MAZDA", conisUser: 3_800_100))
print()
//--------------------------------------------------

enum carError: Error {
    case noName
    case noCount
    case noConis
}


class CollectionCarTry {
    var car = [
        "LEXUS": ItemCar(price: 3_800_000, count: 3),
        "MAZDA": ItemCar(price: 2_500_000, count: 1),
        "MAN": ItemCar(price: 5_300_000, count: 1)
    ]
        
    func buyCar(nameCar name: String, conisUser:Int) throws {
        guard let item = car[name] else {
            throw carError.noName
        }
        guard item.count > 0 else {
            throw carError.noCount
        }
        guard item.price <= conisUser else {
            throw carError.noConis
        }
    }
    
}

var colCarTry = CollectionCarTry()
var car = "MAZDA"
var conis = 2_200_000

do {
    try colCarTry.buyCar(nameCar: car, conisUser: conis)
} catch carError.noName {
    print("машины \(car) нет")
} catch carError.noCount{
    print("такого количества машины \(car) нет")
} catch carError.noConis {
    print("стоимостью \(conis) машины \(car) нет")
} catch let error {
    print(error.localizedDescription)
}
