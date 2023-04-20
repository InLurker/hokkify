import SwiftUI

let quiz1 = Quiz(
    imageName: "quiz_1",
    answers: [
        Answer(
            isCorrect: false,
            answerText: "A-Peh"
        ),
        Answer(
            isCorrect: true,
            answerText: "A-Î"
        )
    ]
)

let quiz2 = Quiz(
    imageName: "quiz_2",
    answers: [
        Answer(
            isCorrect: false,
            answerText: "A-Koo"
        ),
        Answer(
            isCorrect: true,
            answerText: "A-Má"
        )
    ]
)

let quiz3 = Quiz(
    imageName: "quiz_3",
    answers: [
        Answer(
            isCorrect: true,
            answerText: "Má-mah"
        ),
        Answer(
            isCorrect: false,
            answerText: "Pá-pah"
        )
    ]
)
