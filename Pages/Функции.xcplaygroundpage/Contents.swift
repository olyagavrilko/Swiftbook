//: [Previous](@previous)

import Foundation

// Сквозные параметры
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Выведет "someInt is now 107, and anotherInt is now 3"

// Функциональные типы
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
} // (a: Int, _ b: Int) -> Int - тип функции

func printHelloWorld() {
    print("hello, world")
} //  тип () -> Void

var mathFunction: (Int, Int) -> Int = addTwoInts // в конст. или перем. можно присвоить функцию
mathFunction(2, 3)

// MARK: - Захват

class TestClass1 {
    
    var prop = 0
    
    lazy var closure: () -> Void = { [weak self] in
        print(self!.prop)
    }
    
    func foo() {
        print()
    }
    
    deinit {
        print("Deinited")
    }
}

var testObject1: TestClass1? = TestClass1()

var foo: () -> Void = testObject1!.foo // Всегда будет захват
var closure: () -> Void = testObject1!.closure // Можем управлять захватом

testObject1 = nil

//: [Next](@next)
