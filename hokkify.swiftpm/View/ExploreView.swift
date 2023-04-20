import SwiftUI

struct ExploreView: View {
    var isExplored = false
    var title: String
    var subtitle: String
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                VStack () {
                    Spacer()
                    GrandstanderText(
                        title,
                        30 + min(screenWidth, screenHeight) * 0.03,
                        weight: "SemiBold"
                    )
                    .padding(6 + screenHeight * 0.02)
                    GrandstanderText(
                        subtitle,
                        10 + min(screenWidth, screenHeight) * 0.02,
                        weight: "Regular"
                    )
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack(spacing: 30) {
                        NavigationLink(destination: FamilyTreeView()){
                            VStack{
                                Image("familytree")
                                    .resizable()
                                    .scaledToFit()
                                GrandstanderText(
                                    "Family Tree",
                                    15 + min(screenWidth, screenHeight) * 0.02,
                                    .black,
                                    weight: "SemiBold")
                            }
                            .padding(.horizontal, 30 + screenWidth * 0.015)
                            .padding(.vertical, 20 + screenHeight * 0.01)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(radius: 10, x: 0, y: 5)
                        }
                        NavigationLink(destination: MinigameView()) {
                            VStack{
                                Image("minigame")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(isExplored ? 1 : 0.7)
                                GrandstanderText(
                                    "Minigame",
                                    15 + min(screenWidth, screenHeight) * 0.02,
                                    .black,
                                    weight: "SemiBold")
                            }
                            .padding(.horizontal, 30 + screenWidth * 0.015)
                            .padding(.vertical, 20 + screenHeight * 0.01)
                            .background(
                                isExplored
                                ? .white
                                : Color(red: 188/255, green: 188/255, blue:188/255)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(radius: 10, x: 0, y: 5)
                        }
                        .disabled(!isExplored)
                    }
                    .frame(maxWidth: screenWidth * 0.8, maxHeight: screenHeight * 0.4, alignment: .center)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(screenHeight*0.05)
                .ignoresSafeArea(.all)
            }.background(
                Image("explore")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}
