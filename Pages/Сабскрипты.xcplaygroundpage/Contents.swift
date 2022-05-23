//: [Previous](@previous)

import Foundation

let array = [1, 2, 3]
array[0] // Пример использования сабскрипта

// Полезный пример
extension Array {
    
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < self.count else {
            return nil
        }
        return self[index]
    }
}

array[safe: 100]

//: [Next](@next)
