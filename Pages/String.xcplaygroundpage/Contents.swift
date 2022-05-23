import UIKit

var greeting = "Guten Tag!"

// Первый символ (G)
greeting[greeting.startIndex]

// Последний символ (!)
greeting[greeting.index(before: greeting.endIndex)]

// Выведет 1 символ, если считать с 0 (u)
greeting[greeting.index(after: greeting.startIndex)]

// Выведет 7 символ, если считать с 0 (a)
greeting[greeting.index(greeting.startIndex, offsetBy: 7)]

// Ошибка выполнения, индекс за пределами диапазона строки
//greeting[greeting.endIndex]

// Создает range всех индексов
for index in greeting.indices {
    print(greeting[index], terminator: " ")
}
print()

// Добавление дркгой строки
greeting.insert(contentsOf: "Rob", at: greeting.index(before: greeting.endIndex))

// Добавление символа
greeting.insert(",", at: greeting.index(greeting.startIndex, offsetBy: 9))

// Удаление символа
greeting.remove(at: greeting.index(before: greeting.endIndex))

// Удаление нескольких символов
let range = greeting.index(greeting.startIndex, offsetBy: 5)..<greeting.endIndex
greeting.removeSubrange(range)

// Подстроки
let greeting1 = "Hello, world!"
let index = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index] // Hello
let newString = String(beginning) // Для удобного использования

// prefix, suffix
"Hello, world!".prefix(5) // Hello
"Hi".prefix(5) // Hi
"Hello, world!".suffix(5) // orld!

// Сравнение строк
let quotation = "Мы с тобой похожи"
let sameQuotation = "Мы с тобой похожи"
quotation == sameQuotation // true

// hasPrefix, hasSuffix
"Hello, world!".hasPrefix("Hello") // true
"Hello, world!".hasPrefix("world!") // false
"Hello, world!".hasSuffix("Hello") // false
"Hello, world!".hasSuffix("world!") // true

/*
 Unicode — стандарт кодирования символов. Бывает, например, utf8, utf16.
 Цифры 8 и 16 обозначают количество битов для номера символа.
 Т. е. для utf8 номера символов могут быть 0...(2^8 - 1) = 0...255
 Каждому символу соответствует номер в таблице Unicode.
*/

let dogString = "Dog!"
for codeUnit in dogString.utf8 {
    print(codeUnit, terminator: " ") // 68 111 103 33
}
print()
