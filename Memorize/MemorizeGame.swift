import Foundation

struct MemorizeGame<CardContent>  {
    var cards: [Card]
    func chooseCard(_ card: Card) {

    }
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}

