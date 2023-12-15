import SwiftUI

struct CardView: View {
    private let card: MemoryCard
    init(_ card: MemoryCard) {
        self.card = card
    }
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            if card.isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
                    .padding(4)
            } else {
                shape
            }
        }
        .aspectRatio(2/3, contentMode: .fill)
    }
}
