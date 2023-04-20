import SwiftUI
import AVFoundation

let correctAudio = try! AVAudioPlayer(
    contentsOf:
        Bundle.main.url(
            forResource: "correct",
            withExtension: "mp3")!
)

let wrongAudio = try! AVAudioPlayer(
    contentsOf:
        Bundle.main.url(
            forResource: "wrong",
            withExtension: "mp3")!
)

let quizes = [quiz1, quiz2, quiz3]

struct MinigameView: View {
    @State private var isPresentingNextView = false
    @State private var indexQuiz: Int = 0
    @State private var quiz: Quiz
    @State private var minigameComplete = false
    init(){
        self.quiz = quizes[0]
        wrongAudio.volume = 0.5
        wrongAudio.prepareToPlay()
        correctAudio.volume = 0.5
        correctAudio.prepareToPlay()
    }
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                ZStack(alignment: .center) {
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Image(quiz.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.95, height: 0.95 * screenHeight)
                                .offset(x: screenWidth * -0.005)
                            Spacer()
                        }
                        Spacer()
                    }.background(.white)
                    VStack{
                        Spacer()
                        HStack (spacing: 50){
                            ForEach(quiz.answers, id: \.self) { answer in
                                Button(action: {
                                    if answer.isCorrect {
                                        correctAudio.stop()
                                        correctAudio.currentTime = 0
                                        correctAudio.play()
                                    } else {
                                        wrongAudio.stop()
                                        wrongAudio.currentTime = 0
                                        wrongAudio.play()
                                    }
                                    if answer.isCorrect {
                                        isPresentingNextView = true
                                    }
                                }) {
                                    NavigationLink(
                                        destination:
                                            WellDoneView()
                                    )
                                    {
                                        GrandstanderText(
                                            answer.answerText,
                                            20 + min(screenWidth, screenHeight) * 0.02,
                                            .black,
                                            weight: "SemiBold",
                                            baselineOffset: -5
                                        )
                                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.15)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                    }
                                    .disabled(indexQuiz < 2 || !answer.isCorrect)
                                }
                                .shadow(radius: 5, x: 0, y: 5)
                                .sheet(isPresented: $isPresentingNextView, onDismiss: {
                                    isPresentingNextView = false
                                    if(indexQuiz < 2){
                                        withAnimation(Animation.easeOut(duration: 0.5)){
                                            indexQuiz+=1
                                            quiz = quizes[indexQuiz]
                                        }
                                    }
                                }) {
                                    MiniGameMessageView(
                                        MiniGameMessage(
                                            title: "Awesome!",
                                            subtitle: "You got it right!",
                                            imageNames: ["awesome_" + User.avatarSelection],
                                            actionButtonText: "Next"
                                        )
                                    )
                                }
                            }
                        }.padding(.bottom, screenHeight * 0.075)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .navigationViewStyle(StackNavigationViewStyle())
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}


struct MiniGameMessageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let gameMessage: MiniGameMessage
    
    init (_ gameMessage: MiniGameMessage){
        self.gameMessage = gameMessage
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenWidth = geo.size.width
                let screenHeight = geo.size.height
                VStack(alignment: .center) {
                    
                    Spacer()
                    GrandstanderText(
                        gameMessage.title,
                        20 + min(screenWidth, screenHeight) * 0.015,
                        weight: "SemiBold"
                    )
                    .padding(6)
                    GrandstanderText(
                        gameMessage.subtitle,
                        13 + min(screenWidth, screenHeight) * 0.01,
                        weight: "Regular"
                    )
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                    HStack {
                        ForEach(gameMessage.imageNames, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .frame(maxWidth: screenWidth * 0.7, maxHeight: screenHeight * 0.5)
                    
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                    {
                        MontserratText(
                            gameMessage.actionButtonText,
                            10 + min(screenWidth, screenHeight) * 0.015,
                            .white,
                            weight: "SemiBold"
                        )
                        .padding(.horizontal, 60 + screenWidth * 0.05)
                        .padding(.vertical, screenHeight * 0.01)
                        .background(
                            Color(red:255/255, green: 184/255, blue: 0/255)
                        )
                        .clipShape(Capsule())
                        .foregroundColor(.black)
                    }
                    Spacer()
                }
                .ignoresSafeArea(.all)
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(.white)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
        .statusBarHidden(true)
        .background(.white)
    }
}
