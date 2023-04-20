import SwiftUI

struct GrandstanderText: View {
    var textString: String
    var fontSize: CGFloat
    var textColor: Color
    var fontName: String
    var baselineOffset: CGFloat
    init(_ text: String, _ size: CGFloat, _ color: Color = .black, weight: String = "Medium", baselineOffset:CGFloat = 0) {
        self.textString = text
        self.fontSize = size
        self.textColor = color
        self.fontName = "Grandstander" + (weight.isEmpty ? "" : "-" + weight)
        self.baselineOffset = baselineOffset
    }
    var body: some View {
        Text(textString)
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(textColor)
            .baselineOffset(baselineOffset)
    }
}
