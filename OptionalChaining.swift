import Foundation

//..............Optional Chaining..................//

/*
Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil
*/

class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

let parth = Person()

//print(parth.residence!.numberOfRooms) // runtime error
//instead use parth.residence!.numberOfRooms (Optional Chaining)

if let roomCount = parth.residence?.numberOfRooms{
	print("No of rooms = \(roomCount)")
}else{
	print("Cant find no of rooms")
}

//parth.residence?.numberOfRooms always return optional value (nil or Int?)



