import SwiftUI

struct HonorificDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let familyMember: FamilyMember
    
    init(_ familyMember: FamilyMember) {
        self.familyMember = familyMember
    }
    var body: some View {
        GeometryReader { geo in
            let screenWidth = geo.size.width
            let screenHeight = geo.size.height
            ZStack{
                HStack{
                    VStack{
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        })
                        {
                            Image("navigation_back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100 + (screenWidth-40)*0.08)
                                .padding(.leading, 40)
                                .padding(.bottom, 30)
                                .background(.white)
                        }
                    }
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 0){
                    Spacer()
                    HStack{
                        VStack (alignment: .center){
                            Spacer()
                            Image(familyMember.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height:  min(screenWidth*0.27, screenHeight*0.27))
                        }
                        .frame(width: min(screenWidth*0.32, screenHeight*0.32), height: min(screenWidth*0.32, screenHeight*0.32))
                        .background(
                            familyMember.relationship == "paternal" ?
                            Color(red: 151/255, green:220/255, blue:255/255)
                            : familyMember.relationship == "maternal" ?
                            Color(red: 255/255, green:210/255, blue:244/255)
                            : Color(red: 255/255, green: 228/255, blue: 158/255)
                        )
                        .cornerRadius(25)
                        VStack(alignment: .leading){
                            GrandstanderText(
                                familyMember.honorific.capitalized,
                                5 + min(screenWidth, screenHeight) * 0.032,
                                .black,
                                weight: "Medium",
                                baselineOffset: -5
                            )
                            GrandstanderText(
                                familyMember.chineseHonorific,
                                10 + min(screenWidth, screenHeight) * 0.06,
                                .black,
                                weight: "SemiBold",
                                baselineOffset: -5
                            ).offset(y: 5)
                            SpeechBubbleStack(mirrored: true) {
                                VStack (alignment: .leading) {
                                    if(familyMember.relationship != "self"){
                                        Text("I'm your ")
                                            .font(.custom("Grandstander-Medium", size: 3 + min(screenWidth, screenHeight) * 0.03))
                                            .foregroundColor(.black)
                                            .baselineOffset(-5)
                                        + Text(familyMember.detail + ".")
                                            .font(.custom("Grandstander-Bold", size: 3 + min(screenWidth, screenHeight) * 0.03))
                                            .foregroundColor(.black)
                                            .baselineOffset(-5)
                                        Text("In hokkien, you can call me ")
                                            .font(.custom("Grandstander-Medium", size: 3 + min(screenWidth, screenHeight) * 0.03))
                                            .foregroundColor(.black)
                                            .baselineOffset(-5)
                                        + Text("\"" + familyMember.honorific  + "\".")
                                            .font(.custom("Grandstander-Bold", size: 3 + min(screenWidth, screenHeight) * 0.03))
                                            .foregroundColor(.black)
                                            .baselineOffset(-5)
                                    }
                                    else {
                                        GrandstanderText(
                                            "It's me!",
                                            15 + min(screenWidth, screenHeight) * 0.015,
                                            .black,
                                            weight: "Medium"
                                        )
                                        Text("In hokkien, me is ")
                                            .font(.custom("Grandstander-Medium", size: 3 + min(screenWidth, screenHeight) * 0.03))
                                            .foregroundColor(.black)
                                            .baselineOffset(-5)
                                        + Text("\"" + familyMember.honorific + "\".")
                                            .font(.custom("Grandstander-Bold", size: 3 + min(screenWidth, screenHeight) * 0.03))
                                            .foregroundColor(.black)
                                            .baselineOffset(-5)
                                    }
                                }
                                .padding(.vertical, 5)
                                .padding(.horizontal, 8)
                            }
                        }.padding(20)
                        Spacer()
                    }
                    Spacer()
                    
                    if(familyMember.relationship != "self"){
                        HStack{
                            Spacer()
                            VStack(alignment: .trailing){
                                GrandstanderText(
                                    User.asFamilyMember().honorific.capitalized,
                                    5 + min(screenWidth, screenHeight) * 0.032,
                                    .black,
                                    weight: "Medium",
                                    baselineOffset: -5
                                )
                                GrandstanderText(
                                    User.asFamilyMember().chineseHonorific,
                                    10 + min(screenWidth, screenHeight) * 0.06,
                                    .black,
                                    weight: "SemiBold",
                                    baselineOffset: -5
                                ).offset(y: 5)
                                SpeechBubbleStack(mirrored: false) {
                                    GrandstanderText(
                                        "Hi, " + familyMember.honorific.capitalized + "!",
                                        15 + min(screenWidth, screenHeight) * 0.015,
                                        .black,
                                        weight: "Medium",
                                        baselineOffset: -5
                                    )
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 8)
                                }
                            }.padding(20)
                            
                            VStack (alignment: .center){
                                Spacer()
                                Image(User.asFamilyMember().imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:  min(screenWidth*0.27, screenHeight*0.27))
                            }
                            .frame(width: min(screenWidth*0.32, screenHeight*0.32), height: min(screenWidth*0.32, screenHeight*0.32))
                            .background(
                                Color(red: 255/255, green: 228/255, blue: 158/255)
                            ).cornerRadius(25)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, screenWidth * 0.05)
                .padding(.bottom, screenHeight * 0.1)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all)
        .background(.white)
    }
}
