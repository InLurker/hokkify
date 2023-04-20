import SwiftUI

struct User {
    static var avatarSelection = "boy"
    static func asFamilyMember() -> FamilyMember{
        return FamilyMember(
            imageName: "me_" + avatarSelection,
            chineseHonorific: "我",
            honorific: "guá",
            detail: "me",
            relationship: "self",
            spouse: nil,
            children: nil
        )
    }
}
