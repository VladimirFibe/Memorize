import Foundation

struct MemoryGame<CardContent>  {
    private(set) var cards: [Card]

    init(numberOfPairOfCards: Int, cardContentFactiory: (Int) -> CardContent) {
        cards = []
        for index in 0..<max(2, numberOfPairOfCards) {
            let content = cardContentFactiory(index)
            cards.append(Card(id: 2 * index, content: content))
            cards.append(Card(id: 2 * index + 1, content: content))
        }
        cards.shuffle()
    }
    
    func choose(_ card: Card) {
        print(card.content)
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}

