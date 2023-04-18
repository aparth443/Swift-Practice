import Foundation

//Boolean in swift

let yes = true
let no = false

print(yes)

//Boolean operators are used to compare values generally.

let wrong = (1 == 2) // equality operator ==
print(wrong)

var correct = (1 != 2) // not operator !=
print(correct)

correct = !correct //toggling true to false using not operator
print(correct)

//
let isTrue = 5>2 //greater than operator 
print(isTrue)

//similarly there are <, <= and >= operators also.

//AND operator 

let x = true
let y = true

let and = x && y //returns true if x&y is true or returns false

print(and)

// OR operator

let x1 = false
let y1 = false

let or = x1 || y1 //returns false if both x1 & y1 are false or return true

print(or)

//String equality

let catequalsdog = ("dog" == "cat") //equality operator to compare two strings. returns false
print(catequalsdog)

let catbeforedog = ("cat"<"dog") //returns true if alphabetically cat comes before dog

print(catbeforedog)

//if else statement (same as in c++)

let animal = "Fox"
if (animal == "Cat" || animal == "Dog") {
  print("Animal is a house pet.")
} else {
  print("Animal is not a house pet.")
}

//multiple else if statements

let hourOfDay = 12
var timeOfDay = ""

if hourOfDay < 6 {
  timeOfDay = "Early morning"
} else if hourOfDay < 12 {
  timeOfDay = "Morning"
} else if hourOfDay < 17 {
  timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
  timeOfDay = "Evening"
} else if hourOfDay < 24 {
  timeOfDay = "Late evening"
} else {
  timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

//Ternary operator (same as C++)

var a = 10
var b = 20

var c = a > b ? a + b : b - a
print(c)

//while loop 

var num = 10 
var i = 0
var sum = 0
while(i<=num){
	sum += i
	i += 1
}
print(sum)

//repeat while loop (same as do..while loop in C++)
//statement is executed atleast once in repeat while loop
var rep = 1
repeat{
	rep += 1
}while(rep<1)
print(rep)

//break statement (same as c++)

rep = 0
while(true){
	rep += 1;
	if(rep == 10){
		break
	}
}
print(rep)

//ranges (important)

// range is represented by two numbers with three dots in between. this is closed range meaning both the numbers inclusive and range should be in increasing order.
let closedRange = 1...10 
let notIncludeTen = 1..<10 

// for i in notIncludeTen{
// 	//print(i);
// }

//for loop

var count = 10
sum = 0

for i in 1...count{
	sum += i
}
print(sum)

// where clause in for loop:

//adding only even numbers

sum = 0
for i in 1...count where i%2==0{
	sum += i
}
print(sum)

//continue statement (same as C++)

//adding only odd numbers
count = 10
sum = 0
for i in 1...count{
	if(i%2 == 0){
		continue //skips the loop for particular iteration
	}
	sum += i
}
print(sum)

//switch statements

let number = 10

switch number {
case 0:
  print("Zero")
default:
  print("Non-zero")
}

//case statement can not be empty. if nothing is there just write break

//Advanced Switch Statements (multiple case)

switch hourOfDay {
case 0, 1, 2, 3, 4, 5: //ranges can also be used here : case 0...5:
  timeOfDay = "Early morning"
case 6, 7, 8, 9, 10, 11:
  timeOfDay = "Morning"
case 12, 13, 14, 15, 16:
  timeOfDay = "Afternoon"
case 17, 18, 19:
  timeOfDay = "Evening"
case 20, 21, 22, 23:
  timeOfDay = "Late evening"
default:
  timeOfDay = "INVALID HOUR!"
}

print(timeOfDay)

//case with condition

switch number {
case let x where x % 2 == 0:
  print("Even")
default:
  print("Odd")
}

//partial matching in switch case

let coordinates = (x: 3, y: 2, z: 5)

switch coordinates {
case (0, 0, 0): // 1
  print("Origin")
case (_, 0, 0): // 2
  print("On the x-axis.")
case (0, _, 0): // 3
  print("On the y-axis.")
case (0, 0, _): // 4
  print("On the z-axis.")
default:        // 5
  print("Somewhere in space")
}


