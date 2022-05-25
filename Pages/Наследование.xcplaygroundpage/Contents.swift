//: [Previous](@previous)

import Foundation

/*:
 Наследовать можно только классы. То есть родитель и ребенок обязаны быть классами.
 При наследовании происходит наследование всех свойств и методов родителя, кроме private.
 Родитель может быть только 1! Но протоколов-родителей может быть много. Они пишутся обязательно после родителя.
 Вычисляемые свойства и методы можно переопределять. Исп. ключевое слово override.
 Чтобы предотвратить переопределение, используй слово final func, final var и т.д.
 Чтобы предотвратить наследование, используй final class.
*/

class Animal {
    
    func say() {
        print("I'm animal")
    }
}

class Dog: Animal {
    
    override func say() { // При переопределении функции протокола, слово override не пишем!
        super.say()
        print("And also I'm dog")
    }
}

class Cat: Animal {
    
    override func say() {
        super.say()
        print("And also I'm cat")
    }
}

let animals: [Animal] = [Dog(), Cat()]
for animal in animals {
    animal.say() // Вызовется метод конкретного объекта Dog или Cat, несмотря на то, что тип Animal.
}

//: [Next](@next)
