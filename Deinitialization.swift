import Foundation

//.............Deinitialization..................//

//A deinitializer is called immediately before a class instance is deallocated. Only required for class types. keyword - deinit

let x = 10_000
print(x)

class Bank{
	static var maximumCoins = 100000
	static func distribute(coins requestedCoins: Int)->Int{
		let givenCoins = min(requestedCoins,maximumCoins)
		maximumCoins -= givenCoins
		return givenCoins
	}
	static func receive(coins: Int){
		maximumCoins += coins
	}
}

class Player{
	var coinInPurse: Int
	init(coins: Int){
		coinInPurse = Bank.distribute(coins: coins)
	}

	func win(coins: Int){
		coinInPurse += Bank.distribute(coins:coins)
	}

	deinit{
		Bank.receive(coins:coinInPurse)
	}
}

var newPlayer: Player? = Player(coins: 1000)

print("Player joined with \(newPlayer!.coinInPurse) coins")
print("Remaining coins in a bank = \(Bank.maximumCoins)")

newPlayer!.win(coins: 10000)
print("player's coins = \(newPlayer!.coinInPurse)")
print("Remaining coins in a bank = \(Bank.maximumCoins)")
newPlayer = nil //player left the game. (deinit called)
print("Bank balance = \(Bank.maximumCoins)")
