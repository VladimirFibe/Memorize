import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var emojiMemoryGame =
    EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: emojiMemoryGame)
        }
    }
}
