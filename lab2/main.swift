import UIKit 

// 1)
func greet(name:String)->Void{
     print("Hello \(name)!")
}

greet(name:"Umit")

// 2)
func area(width w:Int, height h:Int)->Int{
     var res = 0
     res = w * h
     
     return res
}

area(width: 1, height: 2)

// 3)
func area2(_ w:Int, _ h:Int)->Int{
     var res = 0
     res = w*h
     
     return res
}

area2(2, 3)


// 4)
func calculator(a:Int, b:Int, op:String)->Int{
     
     func plus(a:Int, b:Int)->Int {return a+b}
     func minus(a:Int, b:Int)->Int {return a-b}
     func multi(a:Int, b:Int)->Int {return a*b}
     func divide(a:Int, b:Int )-> Int{return a/b}
     
     switch op{
          case "+":
               return plus(a:a,b:b)
          case "-":
               return minus(a:a,b:b)
          case "*":
               return multi(a:a,b:b)
          case "/":
               return divide(a:a,b:b)
          default:
               return 0
     }
}

calculator(a: 15, b: 4, op:"+")

func calculator2(op:String)->(Int, Int) -> Int{
     
     func plus(_ a:Int, _ b:Int)->Int {return a+b}
     func minus(_ a:Int, _ b:Int)->Int {return a-b}
     func multi(_ a:Int, _ b:Int)->Int {return a*b}
     func divide(_ a:Int, _ b:Int )-> Int{return a/b}
     
     switch op{
          case "+":
               return plus
          case "-":
               return minus
          case "*":
               return multi
          case "/":
               return divide
          default:
          // $0 first param.
               return $0 + $1
     }
}

var f = calculator2(op: "+")
f(15, 4)

let names = ["Mark", "Jane", "Adam", "Leslie", "Hillary"]

func backwards(s1:String, s2:String)->Bool{return s1>s2}

/*
names.sorted(by: {$0>$1})
*/

var reverse = name.sorted(by: <)
print(reverse)
