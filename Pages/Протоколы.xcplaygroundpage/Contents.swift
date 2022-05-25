//: [Previous](@previous)

import Foundation

// Протоколы могут наследоваться от других протоколов

protocol AnimalProtocol {
    // Любое свойство. Всегда var!
    // Неизменяемое (let или вычисляемое). !!! Проверить вне Playground. Почему то на var не ругается:(
    var color: String { get }
    // Изменяемое
    var weight: Int { get set }
    // Статическое свойство (или классовое через class)
    static var feed: String { get set }
    
    init(weight: Int)
    
    func sayHello(param: Int) -> String
    // Ключевое слово для структур mutating
    mutating func changeWeight(new: Int)
}

class Animal: AnimalProtocol {
    
    static var feed: String = ""
    
    let color: String = ""
    var weight: Int = 0
    
    // Так как этот инициализатор требует протокол, мы обязаны помечать словом required
    // Не нужно обозначать реализацию инициализаторов протокола модификатором required в классах, где стоит модификатор final
    required init(weight: Int) {
        self.weight = weight
    }
    
    func sayHello(param: Int) -> String {
        return ""
    }
    
    // mutating не нужен, так как мы внутри класса. А в структуре нужен
    func changeWeight(new: Int) {
        weight = new
    }
}

let animal = Animal(weight: 4)
animal.weight = 3

/*:
 Синтезированная реализация протокола - ты просто явно указываешь протокол, но тебе не приходится писать его реализацию. Swift ее автоматически подставляет
*/

// Для протокола Equatable это следующие случаи (для Hashable аналогично):

// - Cтруктуры, которые имеют только свойства хранения и соответствуют протоколу Equatable
struct A: Equatable {
    let a: String
}

let a1 = A(a: "Hello")
let a2 = A(a: "Hi")
a1 == a2

// - Перечисления, которые имеют только (непонятное слово) ассоциативные типы и соответствуют протоколу Equatable
enum B: Equatable {
    case a(String)
    case b
}

let b1 = B.a("Hello")
let b2 = B.b
b1 == b2

// - Перечисления, которые не имеют ассоциативных типов
enum C: Equatable {
    case a
    case b
}

let с1 = C.a
let с2 = C.b
с1 == с2

// - Остальные случаи. Нужно имплементировать функцию
class D: Equatable {
    let a: String
    
    init(a: String) {
        self.a = a
    }
    
    static func == (lhs: D, rhs: D) -> Bool {
        lhs.a == rhs.a
    }
}

let d1 = D(a: "Hello")
let d2 = D(a: "Hi")
d1 == d2

// Классовый протокол. Можно ограничить протокол так, чтобы его могли принимать только классы.
// Часто используется для Delegate. Объекты ему соответствующие часто нужно помечать weak, а это возможно сделать, только когда протокол классовый.
protocol DogProtocol: AnyObject, AnimalProtocol { }

// Композиция протоколов (можно использовать и классы)
func foo(param: DogProtocol & D) {  } // Это тип, который принимает объект, который соответствует обоим этим протоколам

// Пример подходящего класса
// class Dog: D, DogProtocol { }

//: [Next](@next)
