import SwiftUI

struct FamilyTreeView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(30)
                    
                    HStack{
                        VStack{
                            GrandstanderText("Family Tree", 25 + min(screenWidth, screenHeight) * 0.03)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .background(.white)
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Spacer()
                            NavigationLink(
                                destination: ExploreView(
                                    isExplored: true,
                                    title: "Ready for a challenge?",
                                    subtitle: "The game is on! Let's test your knowledge.\nYou can head back to the family tree if you need to."
                                )
                            ){
                                Image("navigation_next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100 + screenWidth*0.08)
                                    .padding(.horizontal, 15)
                                    .background(.white)
                            }
                        }
                    }
                    VStack{
                        Spacer()
                        GrandstanderText(
                            "Tip: Click the images to reveal more information!",
                            5 + min(screenWidth, screenHeight) * 0.02,
                            weight: "SemiBold"
                        )
                        .multilineTextAlignment(.center)
                        Spacer()
                        HStack(spacing: screenWidth * 0.06) {
                            familyTreeGenerator(
                                for: paternalFamily,
                                width: screenWidth/17,
                                stackHeight: screenHeight * 0.6,
                                lineColor: Color(red: 85/255, green:197/255, blue:255/255)
                            )
                            familyTreeGenerator(
                                for: maternalFamily,
                                width: screenWidth/17,
                                stackHeight: screenHeight * 0.6,
                                lineColor: Color(red: 255/255, green:152/255, blue:226/255)
                            )
                        }
                        VStack(spacing: 0) {
                            Rectangle()
                                .fill(Color(red: 255/255, green: 184/255, blue: 0/255))
                                .frame(width: screenWidth * 0.45, height: 5, alignment: .center)
                            memberWithoutSpouseIcon(
                                member:
                                    User.asFamilyMember(),
                                width: screenWidth/17,
                                lineColor: Color(red: 255/255, green: 184/255, blue: 0/255),
                                totalHeight: screenHeight * 0.3
                            )
                        }.offset(y: -30)
                        Spacer()
                    }
                    .padding(30)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(.white)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .background(.white)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func familyTreeGenerator(for familyMember: FamilyMember, width: CGFloat, stackHeight: CGFloat, lineColor: Color) -> some View {
        VStack(alignment: .center, spacing: 0) {
            memberAndSpouseIcon(member: familyMember, width: width, lineColor: lineColor, totalHeight: stackHeight * 0.15)
            Rectangle().fill(lineColor).frame(width: 5, height: stackHeight * 0.15, alignment: .center)
            if let children = familyMember.children {
                VStack(alignment: .trailing, spacing: 0) {
                    if let childCount = familyMember.children?.count{
                        Rectangle().fill(lineColor)
                            .frame(
                                width: (width * ((Double(childCount-1) * 2)-2)) +
                                    (Double(childCount-1) * 5) +
                                width * 1.75
                                , height: 5)
                            .padding(.trailing, width * 1.51)
                    }
                    HStack(alignment: .top, spacing: 5) {
                        ForEach(children, id: \.imageName) { child in
                            if (child.spouse != nil)
                            {
                                memberAndSpouseIcon(member: child, width: width, lineColor: lineColor, totalHeight: stackHeight * 0.35)
                                    .offset(y: -5)
                            }
                            else {
                                memberWithoutSpouseIcon(
                                    member: child,
                                    width: width,
                                    lineColor: lineColor,
                                    totalHeight: stackHeight * 0.46
                                )
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func memberAndSpouseIcon(member: FamilyMember, width: CGFloat, lineColor: Color, totalHeight: CGFloat) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(spacing: 5) {
                if(member.children == nil){
                    Rectangle().fill(lineColor).frame(width: 5, alignment: .center)
                }
                FamilyMemberIcon(member, width)
            }
            if let spouse = member.spouse {
                if !spouse.isEmpty {
                    FamilyMemberIcon(spouse[0], width)
                }
            }
        }.frame(height: (member.children==nil ? totalHeight : width))
    }
    
    private func memberWithoutSpouseIcon(member: FamilyMember, width: CGFloat, lineColor: Color, totalHeight: CGFloat) -> some View {
        VStack(spacing: 5) {
            Rectangle().fill(lineColor).frame(width: 5, alignment: .center)
            FamilyMemberIcon(member, width * 1.75)
            GrandstanderText(
                (member.relationship == "self") ? "ME" : member.imageName.uppercased(), 25 + width * 0.1)
            .padding(0)
        }.frame(height: totalHeight)
    }
    
}
