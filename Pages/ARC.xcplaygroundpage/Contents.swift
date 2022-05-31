//: [Previous](@previous)

import Foundation

/*:
 ARC (automatic reference counting) - это функция, которая занимается подсчетом ссылок на объекты. Когда счетчик сильных ссылок достигает 0, происходит удаление объекта из памяти.
 Бывают сильные и слабые ссылки. Сильные ссылки устанавливаются по-умолчанию, а слабые - с использованием ключевых слов weak и unowned.
 Отличия weak от unowned:
    1. weak переменная (var) обязана иметь опциональный тип. unowned такого не требует.
    2. При удалении объекта из памяти, ARC проставляет всем переменным, содержащим ссылку на этот объект, nil. В то же время обращение к unowned вызовет runtime ошибке.
    3.
*/

class Pet { }

var pet1: Pet? = Pet()
unowned let pet2: Pet = pet1!
weak var pet3: Pet? = pet1

pet1 = nil
// print(pet2) // Runtime error
print(pet3 as Any)

/*:
 Главная проблема, которая может возникнуть с ARC - это цикл сильных ссылок. Это происходит, когда два объекта ссылаются друг на друга. Может произойти так, что мы не сможем обратиться к этим объектам (не можем вызвать переменную, которая содержала бы ссылку на этот объект), но они не удалятся из памяти, так как ссылаются друг на друга. В чем проблема? Если таких утечек будет много, память приложения переполнится и приложение упадет с ошибкой.
 
 Эту проблему нам помогают решить слабые ссылки.
*/

class Owner {
    
    weak var cat: Cat?
//    unowned var cat: Cat?
    
    deinit { print("Owner deinited") }
}

class Cat {
    
    var owner: Owner
    
    init(owner: Owner) {
        self.owner = owner
    }
    
    deinit { print("Cat deinited") }
}

var owner: Owner? = Owner()
var cat: Cat? = Cat(owner: owner!)
owner?.cat = cat

//owner = nil
cat = nil
print(owner?.cat as Any) // Если owner.cat weak, то там nil, если unowned, то runtime error

// Применение слабых ссылок в замыканиях. Необходимы при захвате

class View {
    
    let networkService = NetworkService()
    var r: Int?
    
    func didTapButton() {
        networkService.sendRequest { [weak self] response in
            self?.r = response
        }
    }
}

class NetworkService {
    
    func sendRequest(completion: @escaping (Int) -> Void) {
        // Делаем запрос, получаем ответ
        DispatchQueue.main.async {
            completion(5)
        }
    }
}

//: [Next](@next)
