import UIKit

//Задание 1
// решить квадратное уровнение
//ax^2+bx+c=0


let a: Int = 1
let b: Int = -5
let c: Int = 6
var x1: Double
var x2: Double

var d: Double = Double(b*b - 4*a*c)

var a2: Double = Double((2 * a))

print("Задача 1")
print("Решить уравнение \(a)*x^2 + \(b)*x + \(c) = 0")

if a2 == 0 {
    x1 = Double(c / b)
    print("Уравнение \(a)*x^2 + \(b)*x + \(c) = 0 имеет один корнь X=\(x1)")
} else {
    if (d < 0) {
        print("Уравнение \(a)*x^2 + \(b)*x + \(c) = 0 -  корней нет)")
    }
    if d == 0 {
        x1 = (Double(-b) + (sqrt(Double(d)))/a2)
        print("Уравнение \(a)*x^2 + \(b)*x + \(c) = 0 имеет один корнь X=\(x1)")
    }
    if d > 0 {
        x1 = (Double(-b) + sqrt(Double(d)))/a2
        x2 = (Double(-b) - sqrt(Double(d)))/a2
        print("Уравнение \(a)*x^2 + \(b)*x + \(c) = 0 имеет два корня X1=\(x1), X2=\(x2)")
    }
}




//Задание 2
//даны катеты треугольника, найти площадь, периметр и гипотенузу

let k1: Int = 8
let k2: Int = 6

var hpt: Double = sqrt(Double(k1 * k1 + k2 * k2))
var s: Double = Double((k1 * k2)/2)
var p: Double = Double(k1 + k2) + hpt
print("")
print("Задача 2")
print("Треугольник с катетами \(k1) и \(k2) имеет гипотинузу = \(hpt), S = \(s), P = \(p)")




// Задание 3
// сумма вклада за 5 лет

let sum: Double = 25000.10
let pp: Double = 5.3
let year: Int = 5
var summaOut: Double

print("")
print("Задача 3")

summaOut = sum
for _ in 1...year {
    summaOut = (summaOut + summaOut * pp / 100)
}
//округляем
summaOut = round(summaOut*100)/100

print("Сумма вклада \(sum) с \(pp)% за \(year) лет составит \(summaOut)")
