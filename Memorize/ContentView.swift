import SwiftUI

struct ContentView: View {
    var emojis = [
        "🚗", "🚕", "🚌", "🚎",
        "🏎️", "🚓", "🚑", "🚒",
        "🚐", "🛻", "🚚", "🚜",
        "🚲", "🛵", "🛺", "🚔",
        "🚍", "🚖", "🚃", "🚋",
        "🚂", "✈️", "🚀", "🛸",
        "🚁", "🛶", "⛵️", "🚤",
        "🛳️", "🚈", "🚊", "🚠"]
    @State var emojiCount = 20

    var body: some View {
        VStack {
            cards

            cardCountAdjusters
        }
        .padding()
    }

    var cards: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70), spacing: 10)], spacing: 10) {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(.accent)
        }
    }

    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
    }

    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }

    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            emojiCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(emojiCount + offset < 1 || emojiCount + offset > emojis.count)
    }
}

#Preview {
    ContentView()
}
