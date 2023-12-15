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

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70), spacing: 10)], spacing: 10) {
                ForEach(emojis.indices, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
