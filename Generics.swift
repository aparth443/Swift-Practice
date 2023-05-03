import Foundation

//................Generics................//

//Generic Functions(same as in java)

func swapTwoValues<T>(_ a: inout T,_ b: inout T){
	let temp = a 
	a = b
	b = temp
}
var a = 10
var b = 20
swapTwoValues(&a, &b)
print(a)
print(b)

var strA = "Hello"
var strB = "World"
swapTwoValues(&strA, &strB)
print(strA,strB,separator: " ")

//Generic types

//example of stack

struct Stack<Element>{
	var arr: Array<Element> = []

	mutating func push(_ element: Element){
		arr.append(element)
	}
	mutating func pop()->Element{
		return arr.removeLast()
	}
}

var st = Stack<String>()

st.push("Hello")
st.push("India")
st.push("What's up?")
print(st.pop())

//Extending a generic type:
//extension of generic type does not need to write type parameter(Element here)
extension Stack{
	var topItem: Element? {
		return arr.isEmpty ? nil: arr[arr.count-1]
	}
}

if let topItem = st.topItem{
	print("top of the stack st is \"\(topItem)\"")
}

//type constraints

/*
Type constraints specify that the type parameter must inherit from a specific class, or conform to particular protocol.
*/

//Syntax

// func SomeFunction<T:SomeClass,U:SomeProtocol>(
// 	someParam1: T, someParam2: U
// ){
// }

//example 

/*
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
*/

//above function of generic type does not work as == might be different for different struct or class. Hence this..
//Equatable protocol is used here.

func findIndex<T:Equatable>(of valueToFind: T,in array: [T])->Int?{
	for x in 0...array.count-1{
		if(array[x] == valueToFind){
			return x
		}
	}
	return nil
}

let idx = findIndex(of: "X", in: ["A","B","C","X","T"])
print(idx!) //3

//Associated Types:

protocol Container{
	associatedtype Item
	mutating func append(_ item: Item)
	var count: Int { get }
	subscript(i: Int) -> Item{ get }
}

//implementation using stack

struct NewStack<Element>: Container{
	var items : [Element] = []
	mutating func push(_ ele: Element){
		items.append(ele)
	}
	mutating func pop()->Element{
		return items.removeLast()
	}

	//Conformance with Container
	typealias Item = Element
	mutating func append(_ item: Element) {
		self.push(item)
	}
	var count: Int {
		return items.count
	}
	subscript(i: Int)->Element{
		return items[i]
	}
}

var newSt = NewStack<Int>()

newSt.append(5)
newSt.append(6)
newSt.append(8)
print(newSt.count)
print(newSt.pop())

//Using protocol in its associated types constraint:

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}


//Generic Where Clauses

func allItemsMatch<C1:Container,C2:Container>(_ someContainer1:C1,_ someContainer2: C2)-> Bool where C1.Item == C2.Item,C1.Item : Equatable{
	if(someContainer1.count != someContainer2.count){
		return false
	}

	for i in 0..<someContainer1.count{
		if(someContainer1[i] != someContainer2[i]){
			return false
		}
	}

	return true
}

var stackStr = NewStack<String> ()
stackStr.push("uno")
stackStr.push("dos")
stackStr.push("tres")

extension Array:Container{}

var arrStr = ["uno","dos","tres"]

if allItemsMatch(stackStr, arrStr){
	print("Both items match")
}else{
	print("Both items does not match")
}

//Extensions with generic where clause

extension NewStack where Element: Equatable{
	func isTop(_ item: Element)->Bool{
		guard let topItem = items.last else{
			return false;
		}
		return topItem == item
	}
}

if(stackStr.isTop("tres")){
	print("top element is tres")
}else{
	print("top element is not tres")
}

//Generic where clause with extensions to protocol

extension Container where Item: Equatable{
	func startsWith(_ item: Item)->Bool{
		return count>=1 && self[0] == item
	}
}

if [1,2,3].startsWith(1){
	print("Array starts with 1")
}

//Generic where clause with extensions where item equals to certain type:

extension Container where Item == Double{
	func average()->Double{
		var sum = 0.0
		for i in 0...count-1{
			sum += self[i]
		}
		return (sum/Double(count))
	}
}

print([3.4,13.5,6.1].average())

//Contexual where clauses

extension Container{
	func average()->Double where Item == Int{
		var sum = 0.0
        for index in 0..<count {
            sum += Double(self[index])
        }
        return sum / Double(count)
	}
	func endsWith(_ item: Item)->Bool where Item : Equatable{
		return count>=1 && self[count-1] == item
	}
}

let ar = [1,2,3,4,5]
print(ar.average())
print(ar.endsWith(5))

