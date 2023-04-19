import Foundation

//...........Set .............//
//Sets - when ordering of elements are not important but only need to store unique elements

//creating empty set of any datatype
//Syntax var variableName = Set<Datatype>()
var newSet = Set<Int> ()
print(newSet.count)

//set with array literals

var setArr: Set<String> = ["Parth","Anil"]
print(setArr.count)

//type definition is not important
var strSet: Set = ["Set","Hash"]
print(strSet)

//Accessing and Modifying Set

//Count method to count number of elements in set

print(strSet.count)

//isEmpty to check if set is empty or not

if(strSet.isEmpty){
	print("set is empty")
}else{
	print("set has elements")
}

//insert method to add elements in a set

strSet.insert("Dictionary") //order is not important
print(strSet)

//You can remove an item from a set by calling the set’s remove method, which removes the item if it’s a member of the set, and returns the removed value, or returns nil if the set didn’t contain it. Alternatively, all items in a set can be removed with its removeAll() method.

let removed = strSet.remove("Hash") //returns Optional value
print(strSet)

// strSet.removeAll() // make set empty

//contains method to check if set contains particular element

if(strSet.contains("Set")){
	print("strSet contains Set")
}

//iterating over a set

for elements in strSet{
	print("\(elements)")
}

//to iterate over a set in sorted order

for elements in setArr.sorted(){
	print(elements)
}

//set operations: union, intersection, subtraction, symmetric difference

var odd : Set = [1,3,5,7,9]
var even : Set = [2,4,6,8,10]
var prime : Set = [2,3,5,7]

var union = odd.union(even).sorted() // all elements
var intersection = odd.intersection(even).sorted() //empty
var subtracted = odd.subtracting(prime).sorted() //1 9
var symmetricDiff = odd.symmetricDifference(prime).sorted() // Union - Intersection

//Set Membership and Equality

//equality operator to check equality
if(union == intersection){
	print("Not equal")
}

//isSubset(of:) , isSuperset(of: ),isStrictSubset(of: ), isStrictSuperset(of: ),isDisjoint(with:)

let houseAnimals: Set = ["Dog", "Cat"]
let farmAnimals: Set = ["Goat", "Chicken", "Ship", "Dog", "Cat"]
let cityAnimals: Set = ["Pigeon", "Rat"]

print(houseAnimals.isSubset(of: farmAnimals))
// true
print(farmAnimals.isSuperset(of: houseAnimals))
// true
print(farmAnimals.isDisjoint(with: cityAnimals))
// true

