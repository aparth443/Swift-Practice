import Foundation

//..............Closures.....................

//closures are basically inline functions. Similar to lambda expression in other languages. it might take one of this three forms

/*
Global functions are closures that have a name and don’t capture any values.

Nested functions are closures that have a name and can capture values from their enclosing function.

Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
*/

//Example of sorted(by: ) method
//function can be passed to by argument in sorted() method.
let names = ["Chirag","Parth","Gunit","Vikas"]

func sortAsc(_ a:String,_ b:String) -> Bool{
	return a<b
}

var newNames = names.sorted(by: sortAsc)
print(newNames)

//this is not a good idea to write explicit function for a<b line. Instead closure inline function can be used.

//Closure syntax

/*
{ (<#parameters#>) -> <#return type#> in
   <#statements#>
}
*/

var reversedNames = names.sorted(by: {
	(_ a:String,_ b:String) -> Bool in 
	return a>b
})
print(reversedNames)

//Infering type from context

//here sorting takes place on array of string so arguments must be (String,String)->Bool hence swift recognise it.

//no need to specify type and -> in return type
reversedNames = names.sorted(by: {s1,s2 in return s1>s2})
print(reversedNames)

//implicit returns from single-expression closure

reversedNames = names.sorted(by: {s1,s2 in s1>s2})

//here return keyword is not required as only single statement is there in closure

//Shorthand argument names
reversedNames = names.sorted(by: {$0>$1})

//here $0 and $1 represents string arguments

//Operator methods

reversedNames = names.sorted(by: >)

//Trailing Closures

//Using closure in map method of array

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let newNums = numbers.map({
	(number) -> String in
	var num = number
	if(num == 0){
		return digitNames[num]!
	}
	var ans = ""
	while(num>0){
		let dig = num%10
		ans = digitNames[dig]! + ans
		num = num/10
	}
	return ans
})

print(newNums)

//if multiple trailing closures are there then first one label can be ignored and remaining must be labelled

//Capturing values

func makeIncrementer(_ amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//above function returns another function of type ()->Int

let incrementBy10 = makeIncrementer(10)
let x = incrementBy10() //10
let y = incrementBy10() //20
print(incrementBy10()) //30


//Closures are reference types:

//whenever a function or closure is assigned to some variable or constant then it is assigned as reference.



