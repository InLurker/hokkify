import SwiftUI


struct WelcomeView: View {
    var body: some View {
        NavigationView() {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                ZStack {
                    Color(red: 114/255, green: 198/255, blue: 241/255)
                    
                    VStack{
                        Spacer().frame(height: screenHeight * 0.05)
                        
                        HStack{
                            Image("cloud")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(
                                    width: min(screenWidth * 0.4, screenHeight * 0.5))
                                .offset(x: screenWidth * -0.1)
                            
                            Spacer()
                            
                            Image("cloud")
                                .resizable()
                                .scaleEffect(CGSize(width: -1.0, height: 1.0))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: min(screenWidth * 0.4, screenHeight * 0.5))
                                .offset(x: screenWidth * 0.1)
                        }
                        Spacer()
                    }
                    .frame(width: screenWidth, height: screenHeight)
                    
                    VStack{
                        Spacer()
                        Image("Hokkify!")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                maxWidth: max(screenWidth * 0.35, screenHeight * 0.3)
                            )
                        
                        Image("Hokkify!_subtitle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                maxWidth: max(screenWidth * 0.35, screenHeight * 0.3)
                            )
                        
                        Spacer(minLength: screenHeight * 0.65)
                    }
                    VStack{
                        Spacer()
                        Image("onboarding_bottom")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                maxHeight: screenHeight * 0.65,
                                alignment: .center
                            )
                            .clipped()
                            .offset(y: 10)
                    }
                    .frame(
                        width: screenWidth,
                        height: screenHeight,
                        alignment: .center
                    )
                    VStack{
                        GrandstanderText("Hokkify!", 30 + min(screenWidth, screenHeight) * 0.05)
                        NavigationLink(
                            destination: GameMessageView(gameMessage1),
                            label:
                                {
                                    HStack{
                                        Text("▶")
                                            .foregroundColor(.black)
                                            .font(.system(size: 9 + min(screenWidth, screenHeight) * 0.015))
                                        MontserratText(
                                            "Let's Start",
                                            10 + min(screenWidth, screenHeight) * 0.015)
                                    }
                                    .padding(.horizontal, 30 + screenWidth * 0.015)
                                    .padding(.vertical, screenHeight * 0.008)
                                    .background(Color.white)
                                    .clipShape(Capsule())
                                    .foregroundColor(.black)
                                }
                        )
                    }
                }
            }.ignoresSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
