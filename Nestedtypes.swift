import Foundation

//............Nested Types...............//

//types inside types(struct, enum, class)

struct Cards{
	enum Suit: Character{ //type enum inside struct
		case spades = "♠"
		case hearts = "♡"
		case diamonds = "♢"
		case clubs = "♣"	
	}
	
	enum Rank: Int{
		case two = 2,three,four,five,six,seven,
		eight,nine,ten
		case jack,queen,king,ace

		struct Values{ //struct inside enum
			var first: Int
			var second: Int?
		}

		var value: Values{
			switch self{
				case .ace:
					return Values(first: 1,second: 11)
				case .jack,.queen,.king:
					return Values(first: 10, second: nil)
				default:
					return Values(first: self.rawValue,second: nil)
					
			}
		}
	}

	let rank: Rank
	let suit: Suit
	var description: String{
		var output = ""
		output += "Suit is of type \(suit.rawValue) & "
		output += "Value is \(rank.value.first)"
		if let secondValue = rank.value.second{
			output += " or \(secondValue)"
		}
		return output
	}
}

let aceOfSpades = Cards(rank: .ace, suit: .spades)
print(aceOfSpades.description)

let heartSymbol = Cards.Suit.hearts.rawValue
print(heartSymbol)