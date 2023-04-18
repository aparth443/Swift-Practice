import Foundation

//Arrays

//used to store ordered lists of values

//var someArray = [someType]()

var arr = [Int] () //Empty array

var arr2 = Array(repeating:2.5, count: 5) //repeating denotes default same value and count is number of elements
print(arr2)

var arr3 = Array(repeating:4.0,count: 2)
print(arr3)

//adding two arrays and assigning it to third variable
var arr4 = arr2 + arr3
print(arr4)

//simple way to initialize array (array literal)

var newArr: [Int] = [1,2,3]
print(newArr)

//accessing elements of the array (zero based indexing)

print(newArr[0])

//modifying / adding elements in array

newArr.append(4) //method 1
newArr += [5] //method 2
print(newArr)

//Iterating over an array

var strArr = [String]()
strArr.append("Apple")
strArr.append("Banana")
strArr[0] = "Cat"

for item in strArr{
	print(item)
}

//The Count Property

print(strArr.count)

//isEmpty

if(!strArr.isEmpty){
	print("Array is not empty")
}

strArr.insert("Apple",at: 0) //to insert at specified index.
print(strArr)

strArr.remove(at:2) //to remove from specified index
print(strArr)