import Foundation

// .............Functions...................

//simple example 

func greeting(person: String) -> String{
	return "Namaste, \(person)!"
}

//func is used to define function. greeting is function name. person is variable name in parameters. String is type of argument. -> String is return type.
let greet = greeting(person:"Parth")
print(greet)

//func without return type

func wishBirthday(person: String){
	print("Happy Birthday \(person)!")
}

wishBirthday(person:"Sachin")

//functions can have multiple arguments, no arguments etc 

func addTwoNumbers(a:Int,b:Int)-> Int{
	return a + b
}
print(addTwoNumbers(a:10,b:5))


//function with multiple value return as a tuple

func minMax(arr : [Int]) -> (min:Int,max:Int)?{
	if(arr.isEmpty){
		return nil
	}
	var mini = arr[0]
	var maxi = arr[0]
	for elements in arr{
		if(elements<mini){
			mini = elements
		}
		if(elements>maxi){
			maxi = elements
		}
	}
	return (mini,maxi)
}

print(minMax(arr:[1,2,3])!)

//function with implicit return

func printHello(person: String) -> String{
	"Hello, \(person)."
}

//if only one line is there to be returned there is no need to write return before it.

print(printHello(person:"Ramesh"))

//Function argument labels and parameter names

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)


//Argument labels 

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

//here from is label for argument value hometown
print(greet(person: "Shamir", from: "Kerala"))

//Ommiting argument labels

//we can ommit argument label by using _

func subtract(_ a:Int,b:Int) -> Int {
	return a-b
}

print(subtract(10,b:50)) // here for 10 label is not required.

//Default Parameters value

func funcWithDefaultValues(_ a:Int = 10,b:Int = 20)->Int{
	return a*b
}

print(funcWithDefaultValues(b:5))

//we can either pass one argument, two argument or zero arguments in above function.

//it is important to put function without default argument first in parameters list.

//variadic parameters (multiple parameters with ...)

func average(_ numbers:Double...) -> Double{
	var sum = 0.0
	for number in numbers{
		sum += number
	}
	return sum/Double(numbers.count)
}

print(average(3.5,6,8,134,54))

//inout parameters -> to change the value of parameters from inside the function

func swap(_ a: inout Int,_ b: inout Int){
	let temp = a
	a = b
	b = temp
}

//while calling the function inout parameter must be entered with & 

var val1 = 10
var val2 = 20
swap(&val1,&val2)
print(val1,val2)

//Function types: used to assign functions to another variable

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

//type of above function is (Int,Int) -> Int

func voidFunction(){
	
}
//type of above function is () -> Void

//Assigning function to variable

var mathFunc: (Int,Int) -> Int = multiplyTwoInts

var mathf = multiplyTwoInts //this is also valid

print(mathf(10,50))

//Function types as parameter:

func someFunc(_ nameOfFunc: (Int,Int)->Int,_ a : Int ,_ b : Int){
	print(nameOfFunc(a,b))
}

someFunc(multiplyTwoInts,10,20)

//here function multiplyTwoInts is passed as an argument in someFunct function

//function type as a return type

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> ((Int) -> Int) {
    return backward ? stepBackward : stepForward
}
let newBackward = chooseStepFunction(backward:true)
print(newBackward(10))

//Nested Functions

func averageOfTwoNums(_ a:Int,_ b:Int) -> Double{
	func sum(_ t:Int,_ l:Int) ->Int{
		return t + l
	}
	return Double(sum(a,b))/2.0
}

print(averageOfTwoNums(10,5))
