struct FamilyMember {
    let imageName: String
    let chineseHonorific: String
    let honorific: String
    let detail: String
    let relationship: String
    let spouse: [FamilyMember]?
    let children: [FamilyMember]?
}

extension FamilyMember: Equatable {
    static func == (lhs: FamilyMember, rhs: FamilyMember) -> Bool {
        return lhs.imageName == rhs.imageName && lhs.chineseHonorific == rhs.chineseHonorific && lhs.honorific == rhs.honorific && lhs.detail == rhs.detail && lhs.relationship == rhs.relationship
    }
}
