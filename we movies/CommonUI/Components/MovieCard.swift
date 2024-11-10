import SwiftUI

struct MovieCard: View {
    let movie: MovieModel
    @ObservedObject var cartManager: CartManager

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: movie.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: (147/360)*UIScreen.main.bounds.width, height: (188/800)*UIScreen.main.bounds.height)
                    .cornerRadius(4)
            } placeholder: {
                ProgressView()
            }

            Text(movie.title)
                .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                .foregroundColor(Color.primaryColor)

            Text("R$ \(movie.price, specifier: "%.2f")")
                .font(.custom(AppFonts.regular, size: FontSizes.price))
                .foregroundColor(Color.primaryColor)

            Button(action: {
                if cartManager.isInCart(movie: movie) {
                    cartManager.removeAllOcurrencesFromCart(movie: movie)
                } else {
                    cartManager.addToCart(movie: movie)
                }
            }) {
                Text(cartManager.isInCart(movie: movie) ? "Adicionado" : "Adicionar ao Carrinho")
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(cartManager.isInCart(movie: movie) ? Color.green : Color.accent)
                    .cornerRadius(4)
            }
        }
        .padding(16)
        .background(Color.secondaryColor)
        .cornerRadius(4)
        .shadow(radius: 5)
    }
}
