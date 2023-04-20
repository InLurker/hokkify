import SwiftUI

struct FamilyMemberIcon: View {
    let familyMember: FamilyMember
    var width: CGFloat
    init(_ familyMember: FamilyMember, _ width: CGFloat) {
        self.familyMember = familyMember
        self.width = width
    }
    var body: some View {
        NavigationLink(
            destination:
                HonorificDetailView(familyMember))
        {
            Image(familyMember.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: width)
        }
    }
}
