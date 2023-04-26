import Foundation
//...............Concurrency (multithreading)..................

//asynchronous functions (can wait for some time before executing code unlike synchronous functions)

//syntax


func someFunction(parameter1: String,parameter2: String) async -> String {
	Thread.sleep(forTimeInterval: 3)
	return "someResult"
} 

// async function are called with await keyword. which suspends that code from running until it executes the function.

Task{
	let someResult = await someFunction(parameter1: "String", parameter2: "String")
	print("\(someResult)")
}

//asynchronous sequence: suppose async function returns array so instead of waiting for whole array to return we can use async sequence to load one element of array each time

// let handle = FileHandle.standardInput
// for try await line in handle.bytes.lines {
//     print(line)
// }

//async parallel syntax

/*
async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])

let photos = await [firstPhoto, secondPhoto, thirdPhoto]
show(photos)
*/

