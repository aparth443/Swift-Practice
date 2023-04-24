import Foundation

//..................Subscript.....................

//subscript syntax (read-write or read only)

/*
subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
}
*/

struct Table{
	let multiplier: Int
	subscript(index: Int)->Int{
		return index*multiplier
	}
}

var threeTable = Table(multiplier: 3)
print("Three times six equals \(threeTable[6])")

//multiple subscripts can be defined in any class or structure which is called subscript overloading

struct Matrix {
    let rows: Int
	let columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(_ row: Int,_ column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            if(indexIsValid(row,column) == false){
				print("Index out of range")
				return 0.0
			}
            return grid[(row * columns) + column]
        }
        set {
            if(indexIsValid(row,column) == false){
				print("Index out of range")
				return
			}
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows:2,columns:2)
print(matrix.grid)
for i in 0...1{
	for j in 0...1{
		matrix[i,j] = Double(i + j)
	}
}
print(matrix.grid)
print(matrix[2,3])//Index out of range

//Type Subscripts ..static 

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let m = Planet[4]
print(m)

