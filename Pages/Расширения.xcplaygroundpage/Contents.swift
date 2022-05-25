//: [Previous](@previous)

import Foundation

/*:
 Расширения добавляют новую функциональность существующему типу класса, структуры или перечисления.
 
 Расширения в Swift могут:

 - Добавлять вычисляемые свойства и вычисляемые свойства типа (static var или class var)
 - Определять (создавать) методы экземпляра и методы типа
 - Предоставлять новые инициализаторы
 - Определять сабскрипты (индексы)
 - Определять новые вложенные типы
 - Обеспечить соответствие существующего типа протоколу
 
 Также можно расширить протокол и реализовать вычисляемое свойство или метод по умолчанию.
*/

protocol Animal {
    func sayHello()
}

extension Animal {
    
    func sayHello() {
        print("I'm animal")
    }
}

class Dog: Animal {
    
    func sayHello() {
        print("I'm dog")
    }
}

class Cat: Animal { } // Если бы в extension протокола мы не реализовали метод sayHello(), то компилятор заставил бы реализовать его внутри класса Cat

let animal1: Animal = Dog()
let animal2: Animal = Cat()

animal1.sayHello()
animal2.sayHello()

//: [Next](@next)
