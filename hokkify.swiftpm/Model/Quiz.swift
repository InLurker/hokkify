import SwiftUI

struct Quiz {
    let imageName: String
    let answers: [Answer]
    static var completionImage: [String] {
            return ["welldone_" + User.avatarSelection]
        }
}

struct Answer: Hashable {
    let isCorrect: Bool
    let answerText: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(answerText)
    }
    
    
}
