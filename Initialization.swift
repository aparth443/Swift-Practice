import Foundation

//..........Initialization(init)............

//Initializers are called to create a new instance of a particular type(class,struct,enum)

// init(){}

struct Temp{
	var temperature: Int
	init(){
		temperature = 35
	}
}

var temp = Temp()
print(temp.temperature)

//customizing initialization

struct Celsius{
	var tempInCelsius: Double

	init(fromF fahrenheit : Double){
		tempInCelsius = (fahrenheit - 32)/1.8
	}
	init(fromK kelvin: Double){
		tempInCelsius = kelvin - 273.15
	}
}

let boilingTemp = Celsius(fromF: 212.0)
let freezingTemp = Celsius(fromK : 273.15)

print("boiling point of water is \(boilingTemp.tempInCelsius) Celsius")
print("freezing point of water is \(freezingTemp.tempInCelsius) Celsius")

//Optional property type - nil by default

class Survey{
	var text: String
	var response: String?
	init(text: String){
		self.text = text
	}
	func ask(){
		print(text)
	}
}

var newSurvey = Survey(text:"Do you like iPhone?")
newSurvey.ask()
//print(newSurvey.response) //nil
newSurvey.response = "Yeah buddy"

//default initializer

class Item{
	var name:String?
	var quantity = 1
	var purchased = false
}

var keychain = Item() //no need of init in class as all the properties have default value

//memberwise initializer for structure types

//structure type have default memberwise initializer if they dont define. 

struct Rectangle{
	var width:Int,height:Int
}

var rect = Rectangle(width:20,height:50)
print(rect.width,rect.height)

//class inheritance and initializer
//designated initializer and convenience initializer

//designated
// init(#parameters){#statements}
//convenience
//convenience init(#parameters){#statements}


/*
Remember this three rules. 
Rule 1
A designated initializer must call a designated initializer from its immediate superclass.

Rule 2
A convenience initializer must call another initializer from the same class.

Rule 3
A convenience initializer must ultimately call a designated initializer.
*/

//failable initializers (init?)

struct Animal{
	let species: String

	init?(species: String){
		if(species.isEmpty){
			return nil
		}
		self.species = species
	}
}

let giraffe = Animal(species: "Giraffe")
if let g = giraffe{
	print(g.species)
}


let anonymous = Animal(species:"")

if anonymous == nil{
	print("Unknown creature!")
}

//failable initializer for enumeration

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")

print(fahrenheitUnit!)

//failable initializer for enumeration with rawValue

enum TempUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fh = TempUnit(rawValue:"F")
print(fh!)

//required initializer

class SomeClass{
	required init(){
		//initializer implementation
		//every subclass of this class must implement this initializer & write required modifier before init()
	}
}



