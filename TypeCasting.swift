import Foundation

//.............Type Casting.................

//Type casting in Swift is implemented with the is and as operators.

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
]

//here the type of library is inferred to be [MediaItem]

for items in library{
	print(items.name)
}

//type check operator: is

var movieCount = 0
var songCount = 0

for item in library{
	if item is Movie{
		movieCount += 1
	}else{
		songCount += 1
	}
}
print("Movie : \(movieCount) & Song: \(songCount)")

//Downcasting: as? or as!

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. by \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

//type casting for Any/AnyObject

// Any can represent an instance of any type at all, including function types.
// AnyObject can represent an instance of any class type.

var things: [Any] = []
things.append(5)
things.append(3.14)
things.append("Parth")
things.append(Movie(name: "3Idiots", director: "Aamir Khan"))
things.append((2,5))
print(things)

for thing in things{
	switch thing{
		case let someInt as Int:
			print(someInt)
		case let someDouble as Double:
			print(someDouble)
		case let someString as String:
			print(someString)
		case let (x,y) as (Int,Int):
			print((x,y))
		case let movie as Movie:
		 	print("\(movie.name) \(movie.director)")
		default:
			print("Something else")
	}
}
