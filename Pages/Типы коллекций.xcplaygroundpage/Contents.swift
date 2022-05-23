//: [Previous](@previous)

import Foundation

// MARK: - Массив (Array) - коллекция упорядоченных значений.

// Создание
var array1: [String] = [] // служ. слово название переменной: тип = значение
var array2 = [String]() // служ. слово название переменной = тип()
var array3 = ["Hello", "world"]

// Вставка элемента
array1.append("hello")
array1.insert("world", at: 1)

// Удаление элемента
array1.remove(at: 0)

// Доступ к элементу
let a = array1[0]
array1[0] = "hello"

// Количество элементов
array1.count

// Итерация по массиву
for item in array1 {
    print(item)
}

for index in 0..<array1.count {
    print(array1[index])
}

// MARK: - Словарь (Dictionary) - коллекция неупорядоченных значений, хранящая пары "ключ-значение".

// Создание
var dict1: [String: String] = [:] //служ._слово название_переменной: тип = значение
var dict2 = [String: String]() //служ._слово название_переменной = тип()
var dict3 = ["name": "Olya", "surname": "Gavrilko"]

// Вставка элемента
dict1["city"] // Выведет nil
dict1["city"] = "Moscow"
dict1["city"] // Выведет Moscow

// Доступ к элементу
let b = dict3["name"] // Выведет Olya
dict3["name"] = "Sergey" // Присвоит Sergey

// Количество элементов
dict1.count

// Итерация по словарю
for (key, value) in dict1 {
    print(key, value)
}

for value in dict3.values {
    print(value)
}


// MARK: - Множество (Set) - коллекция неупорядоченных уникальных значений.

// Создание
var letters = Set<Character>()

var favoriteGenres1: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

// Вставка элемента
favoriteGenres1.insert("Jazz")

// Удаление элемента
favoriteGenres2.remove("Rock")

/*
 Базовые операции множеств

 1. Используйте метод union (_:) для создания нового множества состоящего из всех значений обоих множеств.
 2. Используйте метод intersection(_:) для создания нового множества из общих значений двух входных множеств.
 3. Используйте метод subtracting (_:) для создания множества со значениями не принадлежащих указанному множеству из двух входных.
 4. Используйте метод symmetricDifference(_:) для создания нового множества из значений, которые не повторяются в двух входных множествах.
*/


//: [Next](@next)
