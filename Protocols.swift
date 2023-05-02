import Foundation

//................Protocols................//

//Protocols are similar to interface in java

//Protocol Syntax

// protocol SomeProtocol{
	//protocol definition...
// }

//implementation

// struct SomeStruct: FirstProtocol,SecondProtocol{
	//structure definition goes here
// }

//Property Requirements

/*
	get only or {get and set} with variable name and type
*/

protocol SomeProtocol{
	var onlyGettable: Int {get}
	var gettableAndSettable: Int {get set}
}

//Ex.

protocol FullyNamed{
	var fullName: String {get}
}

class Plane: FullyNamed{
	var name: String
	var prefix: String?
	init(name: String,prefix:String?){
		self.name = name
		self.prefix = prefix
	}
	var fullName: String{
		if prefix != nil{
			return prefix! + " " + name
		}else{
			return name
		}
	}
}

var jet = Plane(name: "747", prefix: "Boeing")
var bigJet = Plane(name: "A380", prefix: "Airbus")
print(jet.fullName)
print(bigJet.fullName)

//Method Requirements

protocol Ratings{
	func calculateRatings(_ parameter1: Int,_ parameter2: Int)->Double
}

class FoodRatings: Ratings{
	func calculateRatings(_ parameter1: Int,_ parameter2: Int)->Double{
		return Double(parameter1 + parameter2)/2.0
	}
}

let pizza = FoodRatings()
print(pizza.calculateRatings(8, 9))

//Initializer Requirements

protocol SomeOtherProtocol{
	init(someParam: Int)
}

class SomeClass: SomeOtherProtocol{
	required init(someParam: Int) { }//marked as required to make sure subclasses also implement this initializer
}


//Protocols as a type:

class PlayerRatings{
	var ratings: Ratings
	var playerAge: Int
	init(ratings: Ratings,age:Int){
		self.ratings = ratings
		self.playerAge = age
	}
	func ratingPercentage(param1:Int,param2: Int)->Double{
		let calculatedRating = ratings.calculateRatings(param1, param2)
		return calculatedRating*10
	}
}

let ronaldo = PlayerRatings(ratings: FoodRatings(), age: 38)
print(ronaldo.ratingPercentage(param1: 7, param2: 9))

//Adding protocol conformance with an Extension

protocol AgeClassificationProtocol{
	var age: Int { get }
	func ageType() -> String
}

class Person {
   let firstname: String
   let lastname: String
   var age: Int
   
   init(firstname: String, lastname: String, age: Int) {
      self.firstname = firstname
      self.lastname = lastname
      self.age = age
   }
}

extension Person: AgeClassificationProtocol{
	func fullName()->String{
		return firstname + " " + lastname
	}

	func ageType() -> String {
		switch age{
			case 0...1:
				return "Infant"
			case 2...4:
				return "Baby"
			case 5...12:
				return "child"
			case 13...18:
				return "Teenager"
			case let x where x>18 && x<60:
				return "Adult"
			default: 
				return "Elderly"
		}	
	}
}

let person1 = Person(firstname: "Ramesh", lastname: "Sharma", age: 14)
print(person1.ageType())

//Class only Protocols

protocol tcpprotocol {
   init(no1: Int)
}
class mainClass {
   var no1: Int        // local storage
   init(no1: Int) {
      self.no1 = no1  // initialization
   }
}
class subClass: mainClass, tcpprotocol {
   var no2: Int
   init(no1: Int, no2 : Int) {
      self.no2 = no2
      super.init(no1:no1)
   }
   
   // Requires only one parameter for convenient method
   required override convenience init(no1: Int) {
      self.init(no1:no1, no2:0)
   }
}

let res1 = mainClass(no1: 20)
let res2 = subClass(no1: 30, no2: 50)

print("res1 is: \(res1.no1)")
print("res2 is: \(res2.no1)")
print("res2 is: \(res2.no2)")

//Protocol Composition

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct PersonX: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = PersonX(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

//checking for protocol conformance

protocol HasArea{
	var area: Double { get }
}

class Circle: HasArea{
	let pi = 3.14
	var radius: Double 
	init(radius: Double){
		self.radius = radius
	}
	var area: Double{
		return pi*radius*radius
	}
}

class Country: HasArea{
	var area: Double
	init(area: Double){
		self.area = area
	}
}

class Animal{ //does not conform to hasArea protocol
	var legs: Int
	init(legs: Int){
		self.legs = legs
	}
}

let objects: [AnyObject] = [
	Circle(radius: 10),
	Country(area: 2400),
	Animal(legs: 4)
]

for object in objects{
	if object is HasArea{
		print(" is: \(object) follow's protocol")
	}
}

for object in objects{
	if let objectsWithArea = object as? HasArea{
		print("as: area is \(objectsWithArea.area)")
	}
}

