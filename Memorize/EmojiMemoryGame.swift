import SwiftUI

typealias MemoryCard = MemoryGame<String>.Card
class EmojiMemoryGame: ObservableObject {
    @Published var model: MemoryGame<String> = createMemoryGame(8)

    var cards: [MemoryCard] {
        model.cards
    }

    func choose(_ card: MemoryCard) {
        model.choose(card)
    }

    func shuffle() {
        model.shuffle()
    }

    // MARK: - static
    private static func createMemoryGame(_ number: Int) -> MemoryGame<String> {
        MemoryGame(numberOfPairOfCards: number) { emojis.indices.contains($0) ? emojis[$0] : "⁉️"}
    }

    private static let emojis = [
        "🚗", "🚕", "🚌", "🚎",
        "🏎️", "🚓", "🚑", "🚒",
        "🚐", "🛻", "🚚", "🚜",
        "🚲", "🛵", "🛺", "🚔",
        "🚍", "🚖", "🚃", "🚋",
        "🚂", "✈️", "🚀", "🛸",
        "🚁", "🛶", "⛵️", "🚤",
        "🛳️", "🚈", "🚊", "🚠"
    ]
}
