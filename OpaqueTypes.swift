import Foundation

//................ Opaque Types ..................//

protocol Shape {
    func draw() -> String
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
       return top.draw() + "\n" + bottom.draw()
    }
}

//triangle

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
       var result: [String] = []
       for length in 1...size {
           result.append(String(repeating: "*", count: length))
       }
       return result.joined(separator: "\n")
    }
}

struct Square: Shape{
	var size: Int
	func draw() -> String{
		let line = String(repeating:"*",count: size)
		let result = Array<String> (repeating: line, count: size)
		return result.joined(separator: "\n")
	}
}

func makeTrapezoid()-> some Shape{ //some shape
	let top = Triangle(size: 2)
	let middle = Square(size: 2)
	let bottom = FlippedShape(shape: top)
	let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom) )
	return trapezoid
}

let trap = makeTrapezoid()
print(trap.draw())