import Foundation

//classes are similar to struct but they are reference type

//class must have initializer unlike struct
//mutating functions are not there in class
//variables are mutable in class itself

class Person{
	var name: String
	var age: Int
	init(name: String,age:Int){
		self.name = name
		self.age = age
	}
	func increaseAge(){
		self.age += 1
	}
}

let parth = Person(name: "Parth", age: 23)
print(parth.name)
print(parth.age)
parth.increaseAge() //here notice parth is let still it increases age. hence class instance can be let and still change the properties
print(parth.age)

let anotherParth = parth
anotherParth.increaseAge() //24 + 1. ->pointing to parth instance
print(anotherParth.age) //25
print(parth.age) //25

//check for equal instance using === //!==

if anotherParth === parth {
	print("Both are pointing to same reference")
}else{
	print("Both are different")
}




