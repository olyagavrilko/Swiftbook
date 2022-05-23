//: [Previous](@previous)

import Foundation

// MARK: - Захват

// Классовый объект

class TestClass1 {
    
    var prop = 0
    
    init() {
        print("Inited")
    }
    
    deinit {
        print("Deinited")
    }
}

var a1: TestClass1? = TestClass1()

var b1 = { [a1] in // [a1] - создание новой константы а, которая ссылается на oбъект из переменной a1. Счетчик ссылок увеличился на 1.
    a1!.prop = 1 // Так как это ссылка на один и тот же классовый объект, то значение поменяется везде
    print(a1!.prop)
}

var c1 = { [newA1 = a1] in // [newA1 = a1] - создание новой константы newA1, которая ссылается на oбъект из переменной a1. Счетчик ссылок увеличился на 1.
    print(newA1!.prop)
}

var d1 = { // Нет захвата
    print(a1!.prop)
}

var e1 = { [weak a1] in // создание новой константы а1, которая ссылается на oбъект из переменной a1. Счетчик ссылок НЕ увеличился, так как произошел захват СЛАБОЙ ссылки.
    print(a1!.prop)
}

// Структурный объект

struct TestStruct2 {
    var prop = 0
    
    mutating func changeProp() {
        prop = 2
    }
}

var a2: TestStruct2? = TestStruct2()

var b2 = { [a2] in // [a2] - создание новой константы а2, в которую копируется объект из переменной
    print(a2!.prop)
}

// Внутри класса

class TestClass3 {
    
    var a1: TestClass1? = TestClass1()
    
    func foo() {
        let b3 = { // Неявный захват self. Счетчик ссылок self увеличился на 1
            print(self.a1!.prop) // Компилятор требует использовать self явно, чтобы было видно, что self захвачен
        }
        
        let c3 = { [self] in // Явный захват self. Счетчик ссылок self увеличился на 1
            print(a1!.prop) // Теперь компилятор НЕ требует использовать self явно
        }
        
        let d3 = { [weak self] in // Явный захват слабой ссылки self. Счетчик ссылок self НЕ увеличился
            print(self!.a1!.prop) // Теперь компилятор требует использовать self явно, причем self стала Optional
        }
        
        let e3 = { [a1] in // Избегаем захвата self. Захватываем только a1
            print(a1!.prop)
        }
        
        b3(); c3(); d3(); e3() // Чтобы не было предупреждений, что не используются
    }
}

// MARK: - Замыкания

// Замыкание имеет ссылочный тип!!!

func foo(_ number: Int, _ string: String) {
    print(number, string)
}

let closure1: (Int, String) -> Void = { (number: Int, string: String) -> Void in
    print(number, string)
}

let closure2: (Int, String) -> Void = { number, string in
    print(number, string)
}

let closure3: (Int, String) -> Void = {
    print($0, $1)
}

// MARK: - Передача замыкания в функцию

func sendRequest(completion: @escaping (Int) -> Void) {
    DispatchQueue.main.async {
        completion(7)
    }
}

sendRequest { response in
    print(response) // Выведет 7
}

//-----------

func map<M, N>(array: [M], transform: (M) -> N) -> [N] {
    var newArray: [N] = []
    for item in array {
        newArray.append(transform(item))
    }
    return newArray
}

map(array: [1, 2, 3]) { item in
    "\(item)"
}

map(array: [1, 2, 3]) { -1 * $0 }


// MARK: - @escaping

// Замыкание называется сбегающим, когда оно вызывается после завершения функции,
// в которую оно было передано

// Пример 1

var closure10: (() -> Void)?

func foo10(closure: @escaping () -> Void) {
    // Считается, что замыкание сбежало из функции, то есть может вызваться после завершения функции
    // Компилятор заставит поставить ключевое слово @escaping
    closure10 = closure
}

// Пример 2

func foo11(closure: @escaping () -> Void) {
    DispatchQueue.main.async {
        // Считается, что замыкание сбежало из функции, то есть вызвается после завершения функции
        // Компилятор заставит поставить ключевое слово @escaping
        closure()
    }
}

//: [Next](@next)
