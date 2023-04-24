import Foundation

//..................Methods.....................

//Instance Methods - Same Syntax as Functions.

class Counter{
	var count = 0
	func increment(){
		count += 1
	}

	func increment(_ amount: Int){
		self.count += amount //use of self to refer count same as this in c++
	}

	func reset(){
		count = 0
	}
}

var counter = Counter()
counter.increment()
counter.increment(5)
print(counter.count)

//Modifying Value Types from within instance methods (for Structures and Enumerations)
//when we modify parameters withing method in value type function needs to be written as mutating

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(_ deltaX: Double, _ deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var p  = Point()
p.moveBy(20.0, 10.0)
print(p.x,p.y)

//Mutating functions does not work on let types. because they are constants.

//Assigning to self within a mutating method

struct NewPoint{
	var x = 0.0
	var y = 0.0

	mutating func moveBy(_ deltaX:Double,_ deltaY:Double){
		self = NewPoint(x: x + deltaX, y: y + deltaY)
	}
}

var newPoint = NewPoint()
newPoint.moveBy(10.0, 10.0)
print(newPoint.x)

enum Directions{
	case North,South,West,East

	mutating func opposite(){
		switch self {
			case .North:
				self = .South
			case .South:
				self = .North
			case .East:
			 	self = .West
			case .West:
				self = .East
		}
	}
}

var top = Directions.North
top.opposite()
print(top) //South

//type methods (static in C++)
//defined with static keyword  (classes can also use class keyword)

class SomeClass{
	static var x = 0
	class func someMethod(){
		x = 10
	}
}

SomeClass.someMethod()
print(SomeClass.x)

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

	@discardableResult //no need to return if not required
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

// using above struct to class

class Player{
	var tracker = LevelTracker()
	let name: String

	func complete(_ level:Int){
		LevelTracker.unlock(level+1)
		tracker.advance(to: level+1)
	}

	init(_ name:String){
		self.name = name
	}
}

var newPlayer = Player("Parth")
newPlayer.complete(1)
print(newPlayer.tracker.currentLevel) //2
print(LevelTracker.highestUnlockedLevel) //2