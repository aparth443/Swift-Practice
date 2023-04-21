import Foundation

//-------------Properties----------------

//Stored Properties

struct FixedLengthRange{
	var firstValue: Int //variable stored property
	let length: Int // constant stored property
}

let threeLengthRange = FixedLengthRange(firstValue: 0, length: 3)

//here properties can not be changed as type is let and it is value type. for reference type it is possible

class FixedLength{
	var firstValue: Int //variable stored property
	let length: Int // constant stored property
	init(firstValue: Int,length: Int){
		self.firstValue = firstValue
		self.length = length
	}
}

let threeLength = FixedLength(firstValue: 0, length: 3)

threeLength.firstValue = 4
print(threeLength.firstValue) //value can still be changed as it is referenced type(class)

//Computed Properties

struct Point{
	var x = 0.0
	var y = 0.0
}

struct Size{
	var width = 0.0
	var height = 0.0
}

struct Rect{
	var origin = Point()
	var size = Size()

	var center: Point{
		get{ //getter
			let centerX = origin.x + (size.width/2)
			let centerY = origin.y + (size.height/2)
			return Point(x: centerX, y: centerY)
		}
		set(newCenter){ //setter
			origin.x = newCenter.x - (size.width/2)
			origin.y = newCenter.y - (size.height/2)
		}
	}
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialCenter = square.center

square.center = Point(x: 7.0, y: 7.0)

print("Square center at \(square.center.x) & \(square.center.y)")


//In the above example Center is a computed property

//Shorthand Setter & Getter Declaration
//instead of defining two variables in getter, directly point is returned 
//here instead of parameter in set newValue is used

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            return Point(x: origin.x + (size.width/2),
				  y: origin.y + (size.height/2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var newSquare = AlternativeRect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 20.0, height: 20.0))

print("x: \(newSquare.center.x), y: \(newSquare.center.y)")

//read only computed property //only getter

struct Cuboid {
	var width = 0.0, height = 0.0, depth = 0.0
	var volume: Double{
		return width*height*depth	
	}
}

let myCuboid = Cuboid(width: 10.0, height: 20.0, depth: 30.0)

print(myCuboid.volume)

//Property Wrapper

@propertyWrapper
struct TwelveOrLess{
	private var number = 0
	var wrappedValue: Int{
		get{
			return number
		}
		set(val){
			number = min(val,12)
		}
	}
}

//above property wrapper ensures that the value of number is always less than or equal to 12

var num = TwelveOrLess()
print(num.wrappedValue)
num.wrappedValue = 10
print(num.wrappedValue)
num.wrappedValue = 15 
print(num.wrappedValue)

//property wrappers are used as follows

struct SmallRect{
	@TwelveOrLess var height: Int
	@TwelveOrLess var width: Int
}

//initial values for wrapped properties

@propertyWrapper
struct SmallNumber{
	private var maximum: Int
	private var number: Int

	var wrappedValue: Int{
		get{
			return number
		}
		set{
			number = min(newValue,maximum)
		}
	}
	init(){
		maximum = 12
		number = 0
	}
	init(wrappedValue:Int){
		maximum = 12
		number = min(wrappedValue,maximum)
	}

	init(wrappedValue:Int,maximum:Int){
		self.maximum = maximum
		number = min(wrappedValue,maximum)
	}
}

struct LittleRect{
	@SmallNumber var height: Int
	@SmallNumber var width: Int
}

var mySmallRect = LittleRect()
print(mySmallRect.height) //0
mySmallRect = LittleRect(height: SmallNumber(wrappedValue: 14, maximum: 15), width: SmallNumber(wrappedValue: 13))

print(mySmallRect.height) //14
print(mySmallRect.width) //12

//type properties (similar to static in other languages)

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

print(SomeStructure.storedTypeProperty) //no need to create an instance
SomeStructure.storedTypeProperty = "Another value"

print(SomeStructure.storedTypeProperty)

//Similarly for enums and classes


enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}


class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

