//: [Previous](@previous)

import Foundation

/*:
 Тема "Приведение к типу" относится только к наследникам класса или к суперклассам из собственной классовой (или протокольной) иерархии. То есть String to Int - это не отсюда.
 
 Два ключевых слова:
 is - проверяет на соответсвие типу. Возвращает Bool
 as - приводит к типу. Возвращает тип, к которому привел
*/

protocol MyProtocol {}
class Animal: MyProtocol {}
class Dog: Animal {}

let animal = Animal()
let dog = Dog()
let tmpAnimal: Animal = Dog()

// let a = dog is Animal // true
// let b = dog is MyProtocol // true
let c = animal is Dog // false
let d = tmpAnimal is Dog // true

let e = dog as Animal // e: Animal, но лежит там dog
let f = tmpAnimal as? Dog // f: Dog?. Если tmpAnimal содержит объект типа Dog, то запишется он, иначе nil
let g = tmpAnimal as! Dog

/*:
 Тип Any - может содержать любой тип данных
 Тип AnyObject - может содержать только классовый тип
*/

let objects1: [Any] = [Animal(), Dog(), "32423", 4]
let objects2: [AnyObject] = [Animal(), Dog()]

//: [Next](@next)
