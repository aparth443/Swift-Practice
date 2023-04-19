import Foundation

/* .........  DICTIONARIES   ........... */

//dictionary consists of key-value pair of same type with key being unique and ordering is not maintained. same as map in c++
//Syntax Dictionary<Key, Value>

//Empty dictionary syntax and example

var dict: [Int:String] = [:]
dict[6] = "Six"
print(dict)
dict = [:] //initializing empty dict with dictionary literal
print(dict)

//initializing dictionary with dictionary literal

var airports = ["AMD": "Ahmedabad","BLR":"Bangalore","DEL":"Delhi"]

//Accessing / modifying dictionary

print(airports["AMD"]!) // returns optional so unwrapp it

//count to count elements in dictionary
print(airports.count)

//isEmpty to check if dictionary is empty

print(airports.isEmpty)

//Insert elements in dictionary with subscript syntax

airports["DXB"] = "Dubai"
print(airports)
//update the value of particular key

airports["AMD"] = "Amadavad"
print(airports)

//to insert or update the value of particular key updateValue("Value",forKey:"Key") syntax is used. this returns optional of old value if key exists or nil if key does not exists.


if let val = airports.updateValue("Ahmedabad", forKey: "AMD"){
	print("Old value of AMD was \(val)")
}

//access the value with subscript syntax which returns Optional value if key exists or nil if key does not exist.

if let airportName = airports["DXB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}

//To remove key value pair from dictionary using subscript syntax assign value to nil

airports["AMD"] = nil
print(airports)

//Remove key-value pair using removeValue(forKey:) syntax returns old value or nil 

if let rem = airports.removeValue(forKey:"BLR"){
	print("\(rem) airport removed successfully.")
}else{
	print("airport did not exist")
}

//Iterating over a dictionary as a tuple

for (code,name) in airports{
	print(code,name,separator:":")
}

//Iterating only keys

for keys in airports.keys{
	print(keys)
}

//Iterating only values

for values in airports.values{
	print(values)
}

//we can create specific key array of value array

let airportCodes = [String](airports.keys).sorted()
print(airportCodes)