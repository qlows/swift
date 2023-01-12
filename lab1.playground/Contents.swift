import UIKit

//
/*
 
 */

var name = "Umit", num = 12, exp = num * 12, msg:String? //question mark is used for optional values

print("Welcome to Xcode, ", name, "!")
print("This is a value of num: \(num)")
print("🥰 \(num)")
var 😍 = "luv"
print(😍)

msg = "num is equal to " + String(num)

let pi = 3 + 0.14159
let bin = 0b010101
let oct = 0o21
let hex = 0x12a
let dec = 1234
let bb = 1.25e2
let f = 1_000_000.00

typealias SamplingRate = UInt16
var x:SamplingRate = 24

let t:(Int, String) = (1, "2") //tuple
var a:Int, b:String
(a, b) = t

let w:(Int, Int) = (1, 2) //tuple
var xa:Int = 10, y:Int = 30
(xa, y) = (y, xa)

msg = nil //null
// print(msg!.count)
//msg?.count

msg = """
\n\u{2665}\"\'
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
"""

var carr:[Character] = ["a", "b", "c"]

msg?.append(String(carr))

if (msg != nil) {
    print(msg!)
}else{
    print("msg is empty.")
}

/*
var grade:String = "A"

switch grade{
case "A":
    print("Amazing")
case "B":
    print("Very Good")
case "C":
    print("Could be better")
case "F":
    print("Booooooo!")
default:
    print("No grade!")
}
*/
var grade:Int = 65

switch grade{
case 80..<100:
    print("Amazing")
case 70..<80:
    print("Very Good")
case 60..<70:
    print("Could be better")
case 50..<60:
    print("Booooooo!")
    fallthrough
default:
    print("No grade!")
}

let somePoint = (1, 1)
switch somePoint{
case (0,0):
    print("in the center")
case (_,0):
    print("on the X axis")
case (0,_):
    print("on the Y axis")
case (-2...2, -3...3):
    print("in the field")
default:
    print("off the grid")
}

for o in 1..<5{
    print(o)
}

gameLoop: while true{
    break gameLoop;
}

/*if let m = msg{
    print(m.count)
}*/

/*if msg != nil {
    print(msg!.count)
}*/



print(f)
