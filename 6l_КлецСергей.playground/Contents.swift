//
//  main.swift
//  6l_КлецСергей
//
//  Created by KKK on 06.03.2021.
//
/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

import Foundation


// Cоздаем стэк
struct Stack<TT> {
    var items: [TT] = []
    mutating func push(_ item: TT){
        items.append(item)
    }
    mutating func pop(_ item: TT){
        items.removeLast()
    }
    //возвращаем nil в случае обращения к несуществующему индексу
    subscript (ind: Int)-> Int? {
        var ret: Int? = nil
        if (ind >= 0)&&(ind < items.count) {ret = ind}
        return ret
    }
}


// выбираем только указвнные элименты
func filterStackOne<TT: Comparable> (item: TT, arr: [TT]) ->[TT]{
    return arr.filter {$0 == item}
}

func filterStackMinMax<TT: Comparable> (min: TT, max: TT, arr: [TT]) ->[TT]{
    var ret: [TT]=[]
    if min>max {return []}
    for (_,val) in arr.enumerated() {
        if (val>=min)&&(val<=max) {ret.append(val)}
    }
    return ret
}

// сортируем
func sortStackUP<TT: Comparable>  (cl: [TT])->[TT] {
    //return cl.sorted(by: {$0 > $1})
    return cl.sorted { (s1, s2) -> Bool in
        s1 < s2
    }
}
func sortStackDOWN<TT: Comparable>  (cl: [TT])->[TT] {
    return cl.sorted { (s1, s2) -> Bool in
        s1 > s2
    }
}
//--------------------------------------------------------
// заполняем
var stackCode = Stack<Int>()
var stackChar = Stack<String>()
var myCode: Int
var myChar: String
for _ in 1...20 {
    myCode = Int.random(in: 65..<90)
    myChar = ""
    myChar.append(Character(UnicodeScalar(myCode)!))
    stackCode.push(myCode)
    stackChar.push(myChar)
}
print(stackCode)
print(stackChar)
print()

// Сортируем
var sortChar = sortStackUP(cl: stackChar.items)
print("сорт Char=",sortChar.description)

var sortCode = sortStackUP(cl: stackCode.items)
print("сорт Code=",sortCode.description)
print()

// выбираем нужные элименты
let fCode = 83
var filCode = filterStackOne(item: fCode, arr: stackCode.items)
print("ищем все",fCode,"выбрали",filCode.description,"и найдено \(filCode.count)" )
let fChar = "L"
var filChar = filterStackOne(item: fChar, arr: stackChar.items)
print("ищем все",fChar,"выбрали",filChar.description,"и найдено \(filChar.count)" )


let fCodeMin = 66
let fCodeMax = 78
var filCodeMM = filterStackMinMax(min: fCodeMin, max: fCodeMax, arr: stackCode.items)
print("ищем все от",fCodeMin,"до",fCodeMax,"выбрали",filCodeMM.description,"и найдено \(filCodeMM.count)" )
let fCharMin = "K"
let fCharMax = "N"
var filCharMM = filterStackMinMax(min: fCharMin, max: fCharMax, arr: stackChar.items)
print("ищем все от",fCharMin,"до",fCharMax,"выбрали",filCharMM.description,"и найдено \(filCharMM.count)" )
print()

//  nil
for i in -1...stackCode.items.count+1 {
    if stackCode[i] == nil {
        print("элемента \(i) в массиве нет")
    } else {
        print("элемент \(i) = \(stackCode.items[i])")
    }
}


