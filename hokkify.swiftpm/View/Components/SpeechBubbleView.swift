import SwiftUI

struct SpeechBubbleStack<Content: View>: View {
    let content: Content
    var mirrored: Bool
    init(mirrored: Bool, @ViewBuilder content: () -> Content) {
        self.mirrored = mirrored
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
            content
                .padding(.horizontal, 25)
                .padding(.top, 25)
                .padding(.bottom, 30)
        }
        .background(
            SpeechBubble()
                .stroke(.black, lineWidth: 4)
                .scaleEffect(CGSize(width: (mirrored ? -1.0 : 1.0), height: 1.0))
        ).padding(.vertical, 0)
    }
    
}

struct SpeechBubble: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: width - 20, y: height - 10))
        bezierPath.addLine(to: CGPoint(x: 15, y: height - 10))
        bezierPath.addCurve(to: CGPoint(x: 0, y: height - 25), controlPoint1: CGPoint(x: 8, y: height - 10), controlPoint2: CGPoint(x: 0, y: height - 18))
        bezierPath.addLine(to: CGPoint(x: 0, y: 15))
        bezierPath.addCurve(to: CGPoint(x: 15, y: 0), controlPoint1: CGPoint(x: 0, y: 8), controlPoint2: CGPoint(x: 8, y: 0))
        bezierPath.addLine(to: CGPoint(x: width - 20, y: 0))
        bezierPath.addCurve(to: CGPoint(x: width - 5, y: 15), controlPoint1: CGPoint(x: width - 12, y: 0), controlPoint2: CGPoint(x: width - 5, y: 8))
        bezierPath.addLine(to: CGPoint(x: width - 5, y: height - 20))
        bezierPath.addCurve(to: CGPoint(x: width, y: height), controlPoint1: CGPoint(x: width - 5, y: height - 1), controlPoint2: CGPoint(x: width, y: height))
        bezierPath.addLine(to: CGPoint(x: width + 1, y: height))
        bezierPath.addCurve(to: CGPoint(x: width - 20, y: height - 10), controlPoint1: CGPoint(x: width - 4, y: height + 1), controlPoint2: CGPoint(x: width - 8, y: height - 1))
        bezierPath.addCurve(to: CGPoint(x: width - 20, y: height - 10), controlPoint1: CGPoint(x: width - 15, y: height - 10), controlPoint2: CGPoint(x: width - 20, y: height - 10))
        return Path(bezierPath.cgPath)
    }
}
