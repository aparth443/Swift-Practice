import Foundation

//Optional datatype 

//Optional has two values either nil or a value 

var maybeString: String?

if(maybeString == nil){
	print("String is nil")
}else{
	print("String has a value")
}

var str: String?
str = "Hello World"

//print(str) //This will print wrapped value  Optional("Hello World")

//To unwrap this
print(str!) //exclaimation is used. forced unwrapping

//Optional Binding: to assign some constants of variables a value of optional

var myString:String?
myString = "Hello"

if let yourString = myString {
   print("Your string has - \(yourString)")
} else {
   print("Your string does not have a value")
}




