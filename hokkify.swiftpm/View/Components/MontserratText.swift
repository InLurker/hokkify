import SwiftUI

struct MontserratText: View {
    var textString: String
    var fontSize: CGFloat
    var textColor: Color
    var fontName: String
    init(_ text: String, _ size: CGFloat, _ color: Color = .black, weight: String = "Medium") {
        self.textString = text
        self.fontSize = size
        self.textColor = color
        self.fontName = "Montserrat" + (weight.isEmpty ? "" : "-" + weight)
    }
    var body: some View {
        Text(textString)
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(textColor)
    }
}
