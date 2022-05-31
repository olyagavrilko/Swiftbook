//: [Previous](@previous)

import Foundation

// Потренировать
// Наследование
// Структурные и классовые типы, String, Array и т.д.
// Как устроена память для классов и структур
// Stack, Queue, List
// Closure для array.first, array.contains и т. д.
// () -> Void и () -> ()

//var a = 3
//var b = 7
//
//func swap(a: inout Int, b: inout Int) {
//    a = a + b
//    b = a - b
//    a = a - b
//}
//
//swap(a: &a, b: &b)
//print(a, b)

//var a = [1, 2, 3]
//
//for item in a {
//    a = [5, 6, 7]
//    print(item)
//}

//var a = [1, 2, 3]
//
//for i in 0..<a.count {
//    a = [5, 6, 7]
//    print(a[i])
//}

//-------

//let array = [1, 2, 3]
//array.reduce(0) { sum, current in
//    sum + current
//}
//
//array.myReduce(0) { sum, currentElement in
//    sum + currentElement
//}
//
//extension Array {
//    func myReduce<M>(_ startValue: M, action: (M, Element) -> M) -> M {
//
//        var storage = startValue
//
//        for item in self {
//            storage = action(storage, item)
//        }
//
//        return storage
//    }
//}
//
//func sendRequest(completion: (Int) -> Void) {
//    completion(7)
//}
//
//sendRequest { result in
//    print("\(result)")
//}

//enum Side: Int, CaseIterable {
//    case north = 4
//    case south = 2
//    case west = 1
//    case east = 3
//
//    var description: String {
//        switch self {
//        case .north:
//            return "Север"
//        case .south:
//            return "Юг"
//        case .west:
//            return "Запад"
//        case .east:
//            return "Восток"
//        }
//    }
//
//    init() {
//        self = .north
//    }
//}
//let defaultSide = Side()
//
//let side = Side(rawValue: 1)
//
//for side in Side.allCases {
//    print(side)
//}
//
//enum MyOptional<T> {
//    case some(T)
//    case none
//}
//
//let optional: MyOptional<Int> = MyOptional.some(5)
//
//switch optional {
//case .some(let value):
//    print(value)
//case .none:
//    print("nil")
//}
//
//if case .some(let value) = optional {
//    print(value)
//}

//var input = [5, 7, 1, 1, 2, 3, 22]
//
//func nonConstructibleChange(_ coins: inout [Int]) -> Int {
//
//    coins = coins.sorted()
//
//    var maxChange = 0
//    print(maxChange)
//
//    if maxChange > 1 {
//        return 1
//    }
//
//    var minNonConstructibleChange = 0
//
//    for coin in coins {
//        if maxChange >= coin {
//            maxChange += coin
//            print(maxChange)
//        } else {
//            minNonConstructibleChange = maxChange + 1
//        }
//    }
//
//    print(minNonConstructibleChange)
//    return minNonConstructibleChange
//}
//
//nonConstructibleChange(&input)


//: [Next](@next)
