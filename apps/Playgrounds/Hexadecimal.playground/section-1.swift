// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//(0xFF0000 & 0x00FF00) >> 16
let rgbMax = 255
let red: CGFloat = 0.5 * CGFloat(rgbMax)
let green: CGFloat = 1.0 * CGFloat(rgbMax)
let blue: CGFloat = 1.0 * CGFloat(rgbMax)

let radix = 16
var redHex: Int = Int(Int(red)/rgbMax)
var blueHex: Int = Int(CGFloat(radix) * green)
var greenHex: Int = Int(CGFloat(radix) * blue)
//num >> 16 & 0xff

let redS = String(redHex, radix: radix)
let greenS = String(greenHex, radix: radix)
let blueS = String(blueHex, radix: radix)

//let radix = 16
//var hex = num * radix
////println(num)
//let hexString: String = String(Int(hex), radix: radix)

// Create hex value from another value
// 0.5 == 88
// 0.75 ==
// 1.0 == FF
String(Int(15.0 * 1.0), radix: 16)


