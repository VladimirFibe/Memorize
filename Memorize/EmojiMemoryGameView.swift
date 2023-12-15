import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel = EmojiMemoryGame()

    let columns = [GridItem(.adaptive(minimum: 75), spacing: 0)]

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.cards) { card in
                        CardView(card)
                            .padding(4)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: viewModel.shuffle) {
                        Text("Shuffle")
                    }
                    .tint(.red)
                }
            }
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
