import Foundation

//...............Enumerations.....................

//enumerations are declared with enum key word
enum Direction{
	case North
	case West
	case East
	case South
}

//multiple cases can be written in single line with one case

//starts with capital letter. Its good practice to write them in singular form
enum Planet{
	case Mercury, Venus, Earth, Mars, Jupiter, saturn, uranus, neptune
}

var topDirection = Direction.North

//we can assign other cases in Direction to topDirection using shorter syntax.
topDirection = .East

//Switch case with enumerations

switch topDirection{
	case .East:
		print("Sun rises")
	case .West:
		print("Sun Sets")
	case .South:
		print("Heading south")
	case .North:
	 	print("Heading North")
}

//Iterating over enumerations cases

enum Drink : CaseIterable{
	case tea,coffee,soda,bear
}

var cnt = Drink.allCases.count //allCases is used to contain all the cases

print(cnt)

for drink in Drink.allCases{
	print(drink)
}

//defining enum cases with different datatypes

enum Code{
	case hexa(Int,Int,Int,Int)
	case qrcode(String)
}

//Associated values

var myCode = Code.hexa(1234,5678,2456,8643)
myCode = Code.qrcode("thisiscode.com")

switch myCode{
	case .hexa(let x,let y,let z,let w):
		print("Code:\(x),\(y),\(z),\(w)")
	case .qrcode(let s):
		print("Code:\(s)")
}

//Raw values 
//Values of same data type can be declared as here

enum Chars: Character{
	case tab = "t"
	case line = "l"
}

//Implicitely assigned raw values

//for integers = +1 then previous one
//for string = text of that string

enum samplePlanet: Int{
	case Mercury=1,earth,jupitor
}

//here value for earth is 2 and jupitor is 3

print(samplePlanet.earth.rawValue)

//Initializing from a raw value

let possiblePlanet = samplePlanet(rawValue:3)
if possiblePlanet != nil{
	print(possiblePlanet!)
}
//returns planet if exists or nil

//recursive enums 

enum Math {
    case number(Int)
    indirect case addition(Math, Math)
    indirect case multiplication(Math, Math)
}

let three = Math.number(3)
let five = Math.number(5)
let sum = Math.addition(three,five)
let multiply = Math.multiplication(sum,five)
//function to evaluate enum expressions

func evaluate(_ expression: Math) -> Int {
	switch expression{
		case let .number(val):
			return val
		case let .addition(left,right):
		    return evaluate(left) + evaluate(right)
		case let .multiplication(left, right):
		    return evaluate(left)*evaluate(right)
	}
}

print(evaluate(sum)) //3 + 5
print(evaluate(multiply)) // (3 + 5)*5


