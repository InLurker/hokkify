import SwiftUI

let gameMessage1 = GameMessage(
    title: "Did you know that",
    subtitle: "In hokkien, we refer to different parts\nof our family in different ways?",
    imageNames: ["family"],
    actionButtonText: "Next",
    nextView: AnyView(GameMessageView(gameMessage2))
)

let gameMessage2 = GameMessage(
    title: "Did you know that",
    subtitle: "Learning can be",
    imageNames: ["simple", "eazy", "fun"],
    actionButtonText: "Next",
    nextView: AnyView(GameMessageView(gameMessage3))
)

let gameMessage3 = GameMessage(
    title: "Excited?",
    subtitle: "So let's get started!",
    imageNames: ["excited"],
    actionButtonText: "Next",
    nextView: AnyView(AvatarSelectionView())
)

