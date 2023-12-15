import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable  {
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
    
    mutating func choose(_ card: Card) {
        guard let index = index(of: card) else { return }
        cards[index].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil // FIXME: bogus!
    }
    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Identifiable, Equatable,
                    CustomDebugStringConvertible {
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down")"
        }

        static func == (lhs: Card, rhs: Card) -> Bool {
            lhs.content == rhs.content && lhs.isFaceUp == rhs.isFaceUp
        }

        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}

