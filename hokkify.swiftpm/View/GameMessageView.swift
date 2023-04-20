import SwiftUI


struct GameMessageView: View {
    let gameMessage: GameMessage
    
    init (_ gameMessage: GameMessage){
        self.gameMessage = gameMessage
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                VStack(alignment: .center) {
                    
                    Spacer()
                    GrandstanderText(
                        gameMessage.title,
                        20 + min(screenWidth, screenHeight) * 0.015,
                        weight: "SemiBold"
                    )
                    .padding(6)
                    GrandstanderText(
                        gameMessage.subtitle,
                        13 + min(screenWidth, screenHeight) * 0.01,
                        weight: "Regular"
                    )
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                    HStack {
                        ForEach(gameMessage.imageNames, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .frame(maxWidth: screenWidth * 0.7, maxHeight: screenHeight * 0.5)
                    
                    Spacer()
                    NavigationLink(
                        destination: gameMessage.nextView,
                        label:
                            {
                                MontserratText(
                                    gameMessage.actionButtonText,
                                    10 + min(screenWidth, screenHeight) * 0.015,
                                    .white,
                                    weight: "SemiBold"
                                )
                                .padding(.horizontal, 60 + screenWidth * 0.05)
                                .padding(.vertical, screenHeight * 0.01)
                                .background(
                                    Color(red:255/255, green: 184/255, blue: 0/255))
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                            }
                    )
                    Spacer()
                }
                .ignoresSafeArea(.all)
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.background(.white)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .statusBarHidden(true)
    }
}
