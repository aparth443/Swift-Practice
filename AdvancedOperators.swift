import Foundation 

//..............Advanced Operators...............//

//Bitwise operators

//not operator ~

let initialBits:UInt8 = 0b00001111
let invertedBits = ~initialBits //11110000
print(invertedBits) //2^4 + 2^5 + 2^6 + 2^7

//and operator & (1 & 1 = 1 else 0)

let andA = 6 //0110
let andB = 9 //1001
print(andA & andB) //0000 

//or operator | (0 | 0 = 0 else 1)

let orA = 6 //0110
let orB = 9 //1001
print(orA | orB) // 1111 

//xor operator ^ (same bits = 0 , different bits = 1)

let xorA = 5  //000101
let xorB = 35 //100011

print(xorA ^ xorB) //100110


//bitwise left shift and right shift operators (<< & >>)

/*
Bitwise left and right shifts have the effect of multiplying or dividing an integer by a factor of two. Shifting an integer’s bits to the left by one position doubles its value, whereas shifting it to the right by one position halves its value.
*/

print(3 << 4) //3*(2^4)
print(45>>3)  //45/(2^3)

//Overflow Operators: &+ , &- , &*

var overflow = Int16.max
// overflow += 1 error
print(overflow)
overflow &+= 1 //number overflows to negative direction
print(overflow)

var unsignedOverflow = UInt8.max
// unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &+ 1
// unsignedOverflow is now equal to 0

//Precedence and Associativity

print(2 + 3 % 4 * 5) //17

//Operator Methods

struct vector2D {
	var x = 0.0
	var y = 0.0
}

extension vector2D{ 
	//arithmatic operator + 
	static func + (left: vector2D, right: vector2D) -> vector2D{
		return vector2D(x: left.x + right.x, y: left.y + right.y)
	}
}

let vector1 = vector2D(x: 1, y: 3)
let vector2 = vector2D(x: 5, y: 9)
let vector3 = vector1 + vector2
print(vector3)

//Prefix and Postfix Operators
extension vector2D{
	static prefix func - (vector:vector2D) -> vector2D{
		return vector2D(x: -vector.x, y: -vector.y)
	}
}

let positive = vector2D(x: 5.0, y: 4.5)
let negative = -positive
print(negative)

//similarly can be done for postfix 

//Compound Assignment Operators += 

extension vector2D{
	static func += (left: inout vector2D, right : vector2D){
		left = left + right
	}
}

var original = vector2D(x: 5.0, y: 7.0)
var addTo = vector2D(x: 4.0,y: 2.0)

original += addTo
print(original)

//Equivalence Operators: ==

extension vector2D: Equatable{
	static func == (left: vector2D, right: vector2D) -> Bool{
		return ((left.x == right.x) && (left.y == right.y))
	}
}

let equA = vector2D(x: 2.0, y: 4.0)
let equB = vector2D(x:2.0, y:4.0)
print(equA == equB)

//custom operators: +++

prefix operator +++ //defining prefix operator +++

extension vector2D{
	static prefix func +++ (vector: inout vector2D) -> vector2D{
		vector += vector
		return vector
	}
}

var toBeDoubled = vector2D(x: 1.0, y: 3.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling)

//Result Builders:

@resultBuilder
struct StringBuilder{
	static func buildBlock(_ components: String...) -> String{
		return components.joined(separator: ", ")	
	}
}

func build(@StringBuilder _ content: ()->String) -> String{
	content()
}

let str = build{
	"Hello" 
	"World"
	"Long"
	"String"
}

print(str)


@resultBuilder
struct StringAddNumbers{
	static func buildBlock(_ components: String...) -> Int{
		let numbers = components.compactMap({Int($0)})
		var sum = 0
		for items in numbers{
			sum += items
		}
		return sum
	}
}

func addNumbers(@StringAddNumbers _ content: ()->Int) -> Int{
	content()
}

let strNums = addNumbers{
	"13"
	"15"
	"24"
	"34"
}

print(strNums) //13 + 15 + 24 + 34
