//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
    case noInternet
    case serverError
    case other(desc: String)
    
    var localizedDescription: String {
        switch self {
        case .noInternet:
            return "No internet"
        case .serverError:
            return "Server error"
        case .other(let description):
            return "Other error: \(description)"
        }
    }
}

class MyError: Error {
    let id: Int
    let description: String
    
    init(id: Int, description: String) {
        self.id = id
        self.description = description
    }
}

// Выброс ошибки. Ошибка обязана соответствовать протоколу Error
throw NetworkError.noInternet
throw MyError(id: 5, description: "")
throw NetworkError.other(desc: "")

func canThrowErrors() throws -> String {
    throw NetworkError.noInternet
}

// 1 способ

do {
    let str = try canThrowErrors()
    print(str)
} catch {
    print(error.localizedDescription)
}

// 2 способ

let str1 = try? canThrowErrors()

// 3 способ

let str2 = try! canThrowErrors()

//: [Next](@next)
