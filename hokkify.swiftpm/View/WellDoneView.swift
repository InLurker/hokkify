import SwiftUI
import AVFoundation

let yayAudio = try! AVAudioPlayer(
    contentsOf:
        Bundle.main.url(
            forResource: "yay",
            withExtension: "mp3")!
)

struct WellDoneView: View {
    init(){
        yayAudio.volume = 0.5
        yayAudio.prepareToPlay()
        correctAudio.volume = 0.5
    }
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                VStack(alignment: .center) {
                    
                    Spacer()
                    
                    GrandstanderText(
                        "Well Done!",
                        20 + min(screenWidth, screenHeight) * 0.015,
                        weight: "SemiBold"
                    )
                    .padding(6)
                    GrandstanderText(
                        "You’ve mastered hokkien honorifics!",
                        13 + min(screenWidth, screenHeight) * 0.01,
                        weight: "Regular"
                    )
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                    HStack {
                        ForEach(Quiz.completionImage, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .frame(maxWidth: screenWidth * 0.7, maxHeight: screenHeight * 0.5)
                    
                    Spacer()
                    GrandstanderText(
                        "Thanks for playing and I hope you had fun!",
                        13 + min(screenWidth, screenHeight) * 0.01,
                        weight: "Regular"
                    ).multilineTextAlignment(.center)
                    Spacer()
                }
                .ignoresSafeArea(.all)
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.background(.white)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .statusBarHidden(true)
        .onAppear(perform: {
            correctAudio.stop()
            correctAudio.currentTime = 0
            correctAudio.play()
            yayAudio.play()
        }
        )
    }
}
