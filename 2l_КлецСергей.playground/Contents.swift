import UIKit

print("Задание 1-4")

// 1. Написать функцию, которая определяет, четное число или нет.
func division2(number num: Int) -> Bool{
    return num % 2 == 0 ? true : false
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func division3(number num: Int) -> Bool{
    return num % 3 == 0 ? true : false
}

// 3. Создать возрастающий массив из 100 чисел.
var arNum: [Int] = []
for i in 1 ... 100 {
    arNum.append(i)
}

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
/* var el: Int = 0
var i: Int = 0
while i < arNum.count {
    el = arNum[i]
    if division2(number: el) || division3(number: el) {
        arNum.remove(at: i)
    }else {
        i += 1
    }
}*/
 
for el in arNum {
    if division2(number: el) || division3(number: el) {
        arNum.remove(at: arNum.firstIndex(of: el)!)
    }
}

print("Массив от 1 до 100 без чисел делящихся на 2 и 3 = \(arNum)")

print("\n")
print("Задание 5")
//------------------------------------------//
//5 .* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func fibonachi(array arrf: inout [Int], num n: Int) {
    if n < 0 { return }
    if n == 0 || n == 1 {
        arrf.append(n)
    }else {
    arrf.append(arrf[n-2]+arrf[n-1])
    }
}
let CountFibon: Int = 50
var arrFibon: [Int] = []
for i in 0 ... CountFibon-1 {
    fibonachi(array: &arrFibon, num: i)
}
print("\(arrFibon.count) чисел Фибоначчи = \(arrFibon)")
    
print("\n")
print("Задание 6")
//6. * Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

var arrErat: [Int] = []
let countN: Int  = 100
var p: Int = 0
for i in 2 ... countN {
    arrErat.append(i)
}

for ii in  0 ... arrErat.count-1 {
    p = arrErat[ii]
   if p > 0 {
        for i in stride(from: ii+p, to: arrErat.count, by: p)
             {
                arrErat[i] = 0
            }
        //print(p,arrErat)
    }
}

print("Простые числа в диапазрне от 2 до \(countN) (0 - вычеркнуто) = \(arrErat)")

let arrEratNum = arrErat.filter( {$0 != 0})

print("Простые числа в диапазрне от 2 до \(countN) = \(arrEratNum)")
