//: [Previous](@previous)

import Foundation

/*:
 class, struct и enum должны иметь как минимум один инициализатор.
 У всех есть инициализатор по умолчанию - init(). Он исчезает, когда есть неинициализированное свойство.
 Объект может быть создан только тогда, когда все его хранимые свойства проинициализированы.
 Проинициализировать свойства можно по-умолчанию или внутри инициализатора.
 Только у struct есть почленный инициализатор - init(width: Double, height: Double).
 Если class является наследником, то сначала нужно проинициализировать все свои свойства, а затем вызвать super.init(). Нельзя инициализировать свойства родителя напрямую.
 Существуют назначенные (обычный init) и вспомогательные (convenience init) инициализаторы. Отличие в том, что вспомогательные инициализаторы внутри себя могут вызывать только self.init (НЕ super.init).
 Ключевое слово required перед определением инициализатора класса необходимо, если вы хотите, чтобы каждый подкласс этого класса был обязан реализовывать этот инициализатор.
*/

class Machine {
    
    var fuelType: String
    
    init(fuelType: String) {
        self.fuelType = fuelType
    }
}
    
class Car: Machine {
    
    var color: String
    
    init(color: String) {
        self.color = color
        super.init(fuelType: "")
        // Первая фаза инициализации окончена. Началась вторая фаза.
        // Теперь мы можем обращаться к свойствам и методам класса, а также к self.
        hello()
        print(self.color)
    }
    
    convenience init() {
        self.init(color: "")
    }
    
    func hello() { }
}

// MARK: - Наследование инициализаторов

/*:
 Если подкласс не имеет ни одного назначеного инициализатора, то он автоматически наследует все назначенные инициализаторы суперкласса
*/

class Animal {
    
    let feed: String
    
    init(feed: String) {
        self.feed = feed
    }
    
    init(old: String) {
        self.feed = "Feed for \(old)"
    }
}

class Dog: Animal {
    
    override init(feed: String) { // Переопределение init
        let dogFeed = "Dog's \(feed)"
        super.init(feed: dogFeed) // Реализация отличается от родителя
    }
}

// MARK: - Проваливающиеся инициализаторы

struct Food {
    
    let spices: [String]
    
    init?(spices: [String]) {
        if spices.isEmpty {
            return nil
        }
        self.spices = spices
    }
}

let food = Food(spices: ["", ""]) // Вернет тип: Food?

//: [Next](@next)
