import Foundation

//............Extensions...............//

//Extension syntax

// extension SomeType {
//     // new functionality to add to SomeType goes here
// }

extension Int{
	func addTwo()->Int{
		return self + 2
	}
}

let four = 4
print(four.addTwo()) //6

//extensions as init

//example 1

struct Person{
	var firstName: String
	var lastName: String
}

extension Person{
	init(fullName: String){
		let components = fullName.components(separatedBy: " ")
		self.init(firstName: components.first ?? fullName, lastName: components.last ?? fullName)
	}
}

let person1 = Person(fullName: "Sachin Tendulkar")
print(person1.firstName)
print(person1.lastName)

//example 2

struct Point{
	var x = 0.0,y = 0.0
}

struct Size{
	var width = 0.0, height = 0.0
}

struct Rect{
	var origin = Point()
	var size = Size()
}

extension Rect{
	init(center: Point,size: Size){
		let originX = center.x - (size.width/2)
		let originY = center.y - (size.height/2)
		self.init(origin: Point(x: originX, y: originY), size: size)
	}
}

let rect = Rect(center: Point(x: 3.0, y: 3.0), size: Size(width: 5.0, height: 5.0))
print(rect.origin)
print(rect.size)

//Computed Properties

extension Double{
	var km: Double {
		return self*1000.0 //km to mtrs
	}
	var m: Double{
		return self
	}
	var cm: Double{
		return self/100.0 //cm to mtrs
	}
	var mm: Double{
		return self/1000.0 //mm to mtrs
	}
}

let oneInch = 25.4.mm

print("1 inch is \(oneInch) in meters")

//extension to methods

extension Int{
	func repeatition(task:()-> Void){
		for _ in 1...self{
			task()
		}
	}
}

let x = 4

func printHello()->Void{
	print("Hello")
}
x.repeatition(task: printHello)

//mutating instance methods

extension Int{
	mutating func cube(){
		self = self*self*self
	}
}

var t = 3
t.cube()
print(t)

//subscripts 

//lets create subscript for finding nth digit decimal in integer
extension Int{
	subscript(idx: Int)->Int{
		var int = self
		var cnt = 0
		while(int > 0){
			int = int/10
			cnt+=1
		}
		if(idx>cnt){
			return -1
		}
		int = self
		var t = idx
		while(t>0){
			int = int/10
			t = t-1
		}
		return int%10
	}
}

var int = 1234565654
print(int[3]) //index from back 0->4, 1->5, 2->6 etc

//nested types

extension Int{
	enum Kind{
		case negative,zero,positive
	}
	var kind:Kind{
		switch self{
			case 0:
				return Kind.zero
			case let x where x>0:
				return Kind.positive
			default:
				return Kind.negative
		}
	}
}

print(4.kind)
print((-1).kind)

func integerTypes(_ numbers: [Int]){
	for number in numbers{
		switch number.kind{
			case .positive:
				print("+ ",terminator: "")
			case .negative:
				print("- ",terminator: "")
			case .zero:
				print("0 ",terminator: "")
		}
	}
	print("")
}

integerTypes([3,4,6,-1,0,-4])

