import Foundation

//........... Access Control ...........//

//Access levels

/*
Open access and public access: enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. 

Internal access: enables entities to be used within any source file from their defining module, but not in any source file outside of that module.

File-private access: restricts the use of an entity to its own defining source file.

Private access: restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. 
*/

//default access level = internal

//Syntax

public class PublicClass{}
internal class InternalClass{}
fileprivate class FilePrivateClass{}
private class PrivateClass{}

public var publicVariable = 0
internal let internalConstant = 0
fileprivate func filePrivateFunction(){}
private func privateFunction(){}

//Access level for function types

//most restrictive level from function's parameters type and return type

private func somePrivateFunc()->(InternalClass,PrivateClass) //here function is marked as private because return type has private class

//Enumeration types
//individual cases has same access level as level of enumeration

//Nested types: Same as containing type. if containing type level is public then nested type will have internal by default. 

//SubClassing

//override makes inherited class member more accessible than its superclass version

public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {} //more accessible than someMethod() in class A
}

public class Aa {
    fileprivate func someMethod() {}
}

internal class Bb: Aa {
    override internal func someMethod() {
        super.someMethod() //this is valid inside same source file.
    }
}

//Getters and Setters  - same access level as defined in its constant, variable, property

struct TrackedString { //internal
    private(set) var numberOfEdits = 0
    var value: String = "" { //internal access 
        didSet {
            numberOfEdits += 1
        }
    }
}

//private(set) makes sure that it is read only property outside structure but can be internally changed as done with didSet property observer:



//to make getter public and setter private we can use:

// public private(set) var numberOfEdits = 0

//Initializers:

//custom initializers level <= type level
//required initializers same as type level
//default initializers: same as type level:

//Protocols : The access level of each requirement within a protocol definition is automatically set to the same access level as the protocol

//Protocol Conformance: A type can conform to a protocol with a lower access level than the type itself

//private members from any type can be accessed from its extension. or declare private member in one extension and access it from its another extension
