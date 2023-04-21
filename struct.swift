import Foundation

//Structures: keyword - struct . structs are value type.

struct Person{
	let name: String //property
	let age: Int //property
}
//struct have default constructor of all arguments
let parth = Person(name: "Parth", age: 23)

//accessing the property
print(parth.name)
print(parth.age)

//Constructor in Struct

struct IPhone{
	let model: String
	let OS: String

	//init is used for constructor. here OS has default value
	init(model:String){
		self.model = model
		self.OS = "iOS"
	}
}

// insteading of init we can write it as follow

/*
struct IPhone{
	let model: String
	let OS: String = "iOS"
}
*/
let proMax = IPhone(model:"14ProMax")
print(proMax.model)
print(proMax.OS)

//property dependent on another property
struct PersonName{
	let firstName: String
	let lastName: String
	var fullName: String{
		"\(firstName) \(lastName)"
	}
}

let myName = PersonName(firstName: "Parth", lastName: "Agrawal")
print(myName.fullName)

//structures inherentaly are immutable and hence cannot change the property of unless defined as mutating

struct Car{
	var speed: Int
	mutating func doubleSpeed(){
		speed = 2*speed
	}
}

var swift = Car(speed: 10)
swift.doubleSpeed()
print(swift.speed)

//structure can not inherit from other structure
