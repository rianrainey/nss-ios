// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// `let` defines a constant. `var` it's just a variable
let c = 40
var temp = 50

// Set var type
var integerImplicit = 40
var integerExplicit:Int = 40
var doubleImplicit = 40
var doubleExplicit:Double = 40

let test0:Float = 4

let label = "The width is"
let width = 94
let widthLabel = label + String(width)

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
