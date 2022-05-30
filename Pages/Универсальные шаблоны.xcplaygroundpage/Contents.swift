//: [Previous](@previous)

import Foundation

func swapTwoInts<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var a = 7
var b = 8

swapTwoInts(&a, &b)

struct Stack<Element> {
    
    private var array: [Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element {
        return array.removeLast()
    }
}

extension Array {
    
    func getValueByIndex(_ index: Int) -> Element {
        self[index]
    }
}

let stack = Stack<Int>()
let array = Array<String>() // Equal to ": [String]()" или ": [String] = []"
let optionalDouble: Optional<Double> = 5 // Equal to ": Double? = 5"
let optionalString = Optional<String>.none // Equal to ": String? = nil"

/*:
 Ограничение типа. Нам важно, чтобы Element соответствовал протоколу Equatable,
 чтобы мы могли сравнивать элементы нашего множества.
*/
struct MySet<Element: Equatable> {
    
    private var array: [Element] = []
    
    mutating func insert(_ element: Element) {
        if !array.contains(element) {
            array.append(element)
        }
    }
    
    mutating func delete(_ element: Element) {
        guard let index = array.firstIndex(of: element) else {
            return
        }
        array.remove(at: index)
    }
}

protocol MyCollection {
    
    // То же самое, что и дженерик, только у протокола
    associatedtype Element

    func insert(_ element: Element)
    func delete(_ element: Element)
}

struct MyIntSet: MyCollection {
    
    // Явное указание типа для протокола. Это не всегда обязательно. Может определяться автоматически
    typealias Element = Int
    
    func insert(_ element: Element) {
        print("insert")
    }
    
    func delete(_ element: Element) {
        print("delete")
    }
}

var optionalBoolString: String? // "true", "false"

// Дополнительные условия "where"

extension String {
    var bool: Bool {
        self == "true"
    }
}

extension Optional where Wrapped == String {
    var bool: Bool {
        guard let value = self else {
            return false
        }
        return value.bool
    }
}

optionalBoolString.bool // Аналогично optionalBoolString?.bool ?? false



//: [Next](@next)
