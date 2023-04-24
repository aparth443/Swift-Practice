import Foundation

//..............Inheritance..........

//base class - classes that does not inherit from other class is base class

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
    }
}

let someVehicle = Vehicle()
print(someVehicle.description)

//subclasses - class that is inherited from superclass is called subclass

//syntex
/*
	class SomeSubclass: SomeSuperclass {
    // subclass definition goes here
}
*/

class Bicycle: Vehicle{
	var hasBasket = false
}

var bicycle = Bicycle()
bicycle.hasBasket = true

print(bicycle.hasBasket)
bicycle.currentSpeed = 14.0
print("Bicycle: \(bicycle.description)")

//subclasses of subclass

class Tandem: Bicycle{
	var noOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.noOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

//Overriding using override keyword

//super keyword to use properties of superclass
/*

someMethod() -> super.someMethod()
An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.

someProperty -> super.someProperty
An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.

someIndex -> super[someIndex]
An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation

*/

class Train: Vehicle{
	override func makeNoise(){
		print("chook chook..")
	}
}

let train = Train()
train.makeNoise()

//overriding property

class Truck: Vehicle{
	var gear: Int = 1
	override var description: String{
		super.description + " on \(gear) gear"
	}
}

let truck = Truck()
truck.currentSpeed = 60.0
truck.gear = 4

print(truck.description)

//preventing overrides - final keyword

//ex. final var, final func, final class func,final subscript, final class



