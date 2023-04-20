import SwiftUI

@main
struct HokkifyApp: App {
    init() {
        let fontNameArray = [
            "Grandstander-Regular",
            "Grandstander-Medium",
            "Grandstander-SemiBold",
            "Grandstander-Bold",
            "Montserrat-Medium",
            "Montserrat-SemiBold"
        ]
        FontLoader.registerFonts(
            fontNames: fontNameArray,
            fontExtension: ".ttf"
        )
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.overrideUserInterfaceStyle = .light
        }
    }
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
