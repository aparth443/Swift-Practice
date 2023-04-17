import Foundation


//this is a comment which is ignored by compiler.
/*
This is multiline comment (Command + /)
*/
print("Hello World")

//Expressions 

print(2 + 5) // prints 7
//print(2 +5) Error either give space on both sides of operator or dont give space at all.

print(22/7) //outputs integer

print(22.0/7) //outputs decimal answer

print(22%7) // remainder operator

//for floating numbers % does not work. below method works for floats.

print((22.0).truncatingRemainder(dividingBy: 7.0))

//shifting digits in binary: Left Shift << , Right Shift >>
//Syntax : integer (<</>>) number of digits 
//left shifted numbers multiplied by 2^digit and right shifted number divided by 2^digit
print(3<<2)

print(128>>4)

//operator precedence : Simple math precedence are used

print(300/5 + 4 * (3+5))

//Math Functions 
print(sin(Double.pi/4));

print(1/(2.0).squareRoot())

print(max(20,5))

print(min(20,5))

//Data naming
//let is used for constant datatype. Int is datatype of Integer. number is name
let number: Int = 10
print(number)

//for variables var is used. 

var variableNumber = 10
print(variableNumber)

//In Swift, you can optionally use underscores to make larger numbers more human-readable. The quantity and placement of the underscores are up to you.

var num = 10_10_10_10000
print(num)

//variable names must be written camelCase

//Increment and decrement (note in swift ++ & -- dont work)
//+= , -= , *=, /= etc

var increment = 10
increment += 1
print(increment)

var decrement = 10
decrement -= 1
print(decrement)



