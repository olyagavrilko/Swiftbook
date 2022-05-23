//: [Previous](@previous)

import Foundation

// MARK: - Операторы передачи управления

// continue - прерывает текущую итерацию цикла и переходит к следующей

// break - прерывает цикл

// fallthrough - используется в switch для проваливания в следующий case

// return - выход из функции

// throw - выход из функции с выбросом ошибки

// MARK: - guard
//guard гарантирует выход из блока, в котором он был определен, в случае невыполнения условия.

guard let name = person["name"] else {
    return
}

//: [Next](@next)
