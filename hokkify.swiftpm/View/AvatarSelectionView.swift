import SwiftUI

struct AvatarSelectionView: View {
    @State var isBoySelected = false
    @State var isGirlSelected = false
    @State var boyOpacity = 0.7
    @State var girlOpacity = 0.7
        
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Spacer()
                    
                    GrandstanderText(
                        "Choose your avatar!",
                        20 + min(screenWidth, screenHeight) * 0.015,
                        weight: "SemiBold"
                    )
                    .padding(6)
                    
                    Spacer()
                    
                    HStack(spacing: 50) { 
                        Button(action: {
                            isBoySelected = true
                            isGirlSelected = false
                            User.avatarSelection = "boy"
                            withAnimation(.easeInOut(duration: 0.5)) {
                                boyOpacity = 1.0
                                girlOpacity = 0.7
                            }
                        }) {
                            Image("stand_boy")
                                .resizable()
                                .scaledToFit()
                                .opacity(boyOpacity)
                                .padding(.horizontal, 35 + screenWidth * 0.015)
                                .padding(.vertical, 20 + screenHeight * 0.01)
                        }
                        .background(
                            isBoySelected
                            ? Color(red: 85/255, green: 197/255, blue: 255/255)
                                .animation(.easeInOut(duration: 0.2))
                            : Color(red: 157/255, green: 222/255, blue: 255/255)
                                .animation(.easeOut(duration: 0.2))
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(radius: 10, x: 0, y: 5)
                        Button(action: {
                            isBoySelected = false
                            isGirlSelected = true
                            User.avatarSelection = "girl"
                            withAnimation(.easeInOut(duration: 0.5)) {
                                boyOpacity = 0.7
                                girlOpacity = 1.0
                            }
                        }) {
                            Image("stand_girl")
                                .resizable()
                                .scaledToFit()
                                .opacity(girlOpacity)
                                .padding(.horizontal, 35 + screenWidth * 0.015)
                                .padding(.vertical, 20 + screenHeight * 0.01)
                        }
                        .background(
                            isGirlSelected
                            ? Color(red: 255/255, green: 157/255, blue: 204/255)
                                .animation(.easeInOut(duration: 0.2))
                            : Color(red: 255/255, green: 202/255, blue: 240/255)
                                .animation(.easeOut(duration: 0.2))
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(radius: 10, x: 0, y: 5)
                        
                    }
                    .frame(maxWidth: screenWidth * 0.7, maxHeight: screenHeight * 0.5)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: ExploreView(
                            isExplored: false,
                            title: "Let's Explore!",
                            subtitle: "Take a look at your family tree and\ncomplete the minigame!"
                        ),
                        label:
                            {
                                MontserratText(
                                    "Confirm",
                                    10 + min(screenWidth, screenHeight) * 0.015,
                                    .white,
                                    weight: "SemiBold"
                                )
                                .padding(.horizontal, 60 + screenWidth * 0.05)
                                .padding(.vertical, screenHeight * 0.01)
                                .background(
                                    isBoySelected || isGirlSelected
                                    ? Color(red:255/255, green: 184/255, blue: 0/255)
                                    : Color(red:255/255, green: 214/255, blue: 107/255)
                                )
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                            }
                    ).disabled(!(isBoySelected || isGirlSelected))
                    Spacer()
                }
                .ignoresSafeArea(.all)
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.background(.white)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}
