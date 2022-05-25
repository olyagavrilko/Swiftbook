//: [Previous](@previous)

import Foundation
import UIKit

class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

let john = Person()
// roomCount - тип Int
let roomCount = john.residence!.numberOfRooms // Если residence == nil - runtime ошибка

// john.residence?.numberOfRooms - тип Int?
// roomCount - тип Int
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// Пример с опциональным замыканием

class MyButton: UIButton {
    
    var action: (() -> Void)?
    
    @objc func didTapButton() {
        action?()
    }
}

let button = MyButton()

button.action = {
    print("hello")
}

// Пример с опциональным массивом

let b: [Int]? = []
let a = b?[3]

//: [Next](@next)
