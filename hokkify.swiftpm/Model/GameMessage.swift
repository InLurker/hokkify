import SwiftUI

struct MiniGameMessage {
    var title: String
    var subtitle: String
    var imageNames: [String]
    var actionButtonText: String

    init(title: String, subtitle: String, imageNames: [String], actionButtonText: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageNames = imageNames
        self.actionButtonText = actionButtonText
    }
}

struct GameMessage {
    var title: String
    var subtitle: String
    var imageNames: [String]
    var actionButtonText: String
    var nextView: AnyView

    init(title: String, subtitle: String, imageNames: [String], actionButtonText: String, nextView: AnyView) {
        self.title = title
        self.subtitle = subtitle
        self.imageNames = imageNames
        self.actionButtonText = actionButtonText
        self.nextView = nextView
    }
}


