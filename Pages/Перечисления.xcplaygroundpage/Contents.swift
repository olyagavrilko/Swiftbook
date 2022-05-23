//: [Previous](@previous)

import Foundation

enum CompassPoint: String { // String - тип rawValue
    case north
    case south
    case west
    case east
}

var directionToHead = CompassPoint.east
print(directionToHead)

switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


// Итерация по кейсам перечисления (CaseIterable)
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available") // Выведет "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}


// Ассоциативные значения
enum Barcode {
    case ups(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.ups(8, 676767, 78, 87)
productBarcode = .qrCode("jdjfjkdf")

switch productBarcode {
case let .ups(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}


// Исходные значения
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


// Неявно установленные исходные значения
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let earthsOrder = Planet.earth.rawValue // значение earthsOrder равно 3

let sunsetDirection = CompassPoint.west.rawValue // значение sunsetDirection равно "west"


// Инициализация через исходное значение
let possiblePlanet = Planet(rawValue: 7) // possiblePlanet имеет тип Planet? и его значение равно Planet.uranus

//: [Next](@next)
