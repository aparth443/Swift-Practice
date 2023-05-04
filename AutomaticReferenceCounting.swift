import Foundation

//........... Automatic Reference Counting ...........//

//used to free up the memory when instances are no longer needed. just like garbage collection in java

class Person{
	var name: String 
	init(name: String){
		self.name = name
		print("initialized")
	}
	deinit{
		print("deinitialized")
	}
}

var ref1 : Person? //not initialized right now (nil)

ref1 = Person(name: "Parth") //initialized now (strong reference)

ref1 = nil //deinitialized now

//Strong reference cycles between class instances

// class NewPerson{
// 	var name: String
// 	init(name: String){
// 		self.name = name
// 		print("\(name) is initialized")
// 	}
// 	var apartment: Apartment?
// 	deinit{
// 		print("\(name) is deinitialized")
// 	}
// }

// class Apartment{
// 	let unit: String
// 	init(unit: String){
// 		self.unit = unit
// 		print("\(unit) is initialized")
// 	}
// 	var tenant: NewPerson?
// 	deinit{
// 	   print("Apartment \(unit) is deinitialized")
// 	}
// }

// var john : NewPerson? //nil 
// var unit4A : Apartment? //nil

// john = NewPerson(name: "John") //apartment is nil (initialized)
// unit4A = Apartment(unit: "4A") // tenant is nil (initialized)

// john!.apartment = unit4A
// unit4A!.tenant = john

//here strong reference cycle is created btw john and unit4A. hence after assigning nil to them ARC does not deallocate memory.

// john = nil // does not deinitialized
// unit4A = nil //does not deinitialized

//Resolving strong reference cycles btw class instances

/*
Two ways to resolve this.
1. Weak References
2. Unowned References
*/

//Weak References

class NewPerson{
	var name: String
	init(name: String){
		self.name = name
		print("\(name) is initialized")
	}
	var apartment: Apartment?
	deinit{
		print("\(name) is deinitialized")
	}
}

class Apartment{
	let unit: String
	init(unit: String){
		self.unit = unit
		print("\(unit) is initialized")
	}
	weak var tenant: NewPerson?
	deinit{
	   print("Apartment \(unit) is deinitialized")
	}
}

var john : NewPerson? //nil 
var unit4A : Apartment? //nil

john = NewPerson(name: "John") //apartment is nil (initialized)
unit4A = Apartment(unit: "4A") // tenant is nil (initialized)

john!.apartment = unit4A
unit4A!.tenant = john

john = nil //deinitialized now as strong reference cycle is not created
unit4A = nil

//unowned references

//Unlike a weak reference, an unowned reference is expected to always have a value

class student {
   let name: String
   var section: marks?
   init(name: String) {
      self.name = name
   }
   deinit { print("\(name) deinitialized") }
}

class marks {
   let marks: Int
   unowned let stname: student
   
   init(marks: Int, stname: student) {
      self.marks = marks
      self.stname = stname
   }
   deinit { print("Marks Obtained by the student is \(marks) and its deinitialized") }
}

var module: student?
module = student(name: "ARC")
module!.section = marks(marks: 98, stname: module!)
module = nil

//Strong reference cycles for closures

class HTMLElement{
	let name: String
	let text: String?

	//lazy property will not be accessed until after initialization has been completed and self is known to exist
	lazy var asHTML: ()->String = {
		if let text = self.text{
			return "<\(self.name)>\(text)</\(self.name)>"
		}else{
			return "<\(self.name)/>"
		}
	}

	init(name: String,text: String? = nil){
		self.name = name
		self.text = text
	}

	deinit{
		print("\(name) being deinitialized")
	}
}

//here class HTML and closure asHTML() creates strong reference cycle 
let heading = HTMLElement(name: "h1")
let someText = "some default text"
heading.asHTML = {
	return "<\(heading.name)>\(heading.text ?? someText)</\(heading.name)>"
}

print(heading.asHTML())

//Capture List to avoid strong reference cycle in closures

class NewHTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
            [unowned self] in //closure list
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

var paragraph: NewHTMLElement? = NewHTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

paragraph = nil //deinitialized



