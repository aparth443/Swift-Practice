import Foundation

//..............Error Handling....................

struct Person{
	let firstName: String?
	let lastName: String?

	enum Errors: Error{
		case firstNameIsNil
		case lastNameIsNil
		case bothNamesAreNil
	}
	func fullName() throws -> String {
		switch (firstName,lastName){
			case (.none,.none):
				throw Errors.bothNamesAreNil
			case (.none,.some):
				throw Errors.firstNameIsNil
			case (.some,.none):
				throw Errors.lastNameIsNil
			case let (.some(firstName),.some(lastName)):
				return "\(firstName) \(lastName)" 
		}
	}
}

let parth = Person(firstName:nil,lastName:"Agrawal")

do{
	let _ = try parth.fullName()
}catch let e{
	print(e) //firstNameisNil
}

//specific error handling

let unknown = Person(firstName:nil,lastName: nil)

do{
	let _ = try unknown.fullName()
}catch Person.Errors.firstNameIsNil{
	print("First name is nil")
}catch Person.Errors.lastNameIsNil{
	print("Last name is nil")
}catch Person.Errors.bothNamesAreNil{
	print("Both names are nil")
}catch {
	print("Some other error")
}

//error handling inside init
struct Car{
	let manufacturer: String

	enum Errors: Error{
		case invalidManufacturer
	}

	init(manufacturer: String) throws{
		if(manufacturer.isEmpty){
			throw Errors.invalidManufacturer
		}
		self.manufacturer = manufacturer
	}
}

do{
	let _ = try Car(manufacturer: "")
}catch Car.Errors.invalidManufacturer{
	print("Manufacturer can't be empty") //this will be printed
}catch{
	print("Some other error occured")
}

//alternative way to just access this struct
if let _ = try? Car(manufacturer: "Tesla"){
	print("Success")
}else{
	print("Failed")
}


//rethrows

enum NameErrors: Error{
	case firstNameInvalid
	case lastNameInvalid
}

func fullName(firstName: String?,lastName:String?,
calculator: (String?,String?)throws -> String?) rethrows -> String?{
	try calculator(firstName,lastName)
}

func + (firstName: String?,lastName: String?) throws -> String {
	if firstName == nil{
		throw NameErrors.firstNameInvalid
	}
	if lastName == nil{
		throw NameErrors.lastNameInvalid
	}
	return "\(firstName!) \(lastName!)"
}

do{
	let _ = try fullName(firstName: "foo",lastName:nil,calculator:+)
}catch NameErrors.firstNameInvalid{
	print("first name is invalid")
}catch NameErrors.lastNameInvalid{
	print("last name is invalid")
}catch let e{
	print("some error: \(e)")
}

//Results

enum IntegerErrors: Error{
	case noPositiveIntegerBefore(thisValue: Int)
}

func previousInteger(from int: Int) -> Result<Int,IntegerErrors>{
	guard int>0 else{
		return Result.failure(
IntegerErrors.noPositiveIntegerBefore(thisValue: int)
		)
	}
	return Result.success(int-1)
}

print(previousInteger(from:0)) //returns failure which is enum


