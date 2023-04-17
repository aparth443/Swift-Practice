import Foundation

//Type Inference 

var num1: Int = 10
var num2: Double = 5.30

num2 = Double(num1) //converting num1 type to double
print(num2)



// In swift, operators can not be applied to multiple datatypes i.e 10 * 5.3 would not work. we need to specifically convert variable to single datatype and then perform operations

print(num1 * Int(num2))

//In swift, we do not need to mention specific type of the variable. Swift automatically determines the type using type inference.

//as type convertion

let num3 = 5 as Double
print(num3)  //5.0

//Character and String
//character and string both are written inside double quotes ""

var charA: Character = "A"
print(charA)

var str: String = "Parth"
print(str)

var str1 = "A"

// here A is single character still it will be considered as single character string. If we need to specify it as character then it must be explicitly type casted.

//Concatenation adding two strings 

var message = "My name is "
let myName = "Parth"
message += myName

print(message)

//Interpolation
let ramesh = "Ramesh"
let greeting = "Hello \(ramesh)!"
print(greeting)

let dec = 1.0/4.0
print("one fourth in decimal is \(dec)")

//multiple line string

let bigString = """
This is an
example of multi..
..line string ..
"""
print(bigString)


//Tuples storing multiple values

let cordinates = (2,3.5)
print(cordinates)

//accessing values of tuples
//here zero indexing is used.
print(cordinates.1)

//we can assign label to each value in tuple 

let newCordinate = (x:2,y:3,z:5)
print(newCordinate.x)
print(newCordinate.y)

// To assign values of tuple to variables following syntax is used.

let (a,b,c) = newCordinate
print(a)

//To ignore specific values we can use _ (underscore)

let (d,e,_) = newCordinate


