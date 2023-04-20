import SwiftUI

public struct FontLoader {
    public static func registerFonts(fontNames: [String], fontExtension: String) {
        for fontName in fontNames {
            registerFont(bundle: Bundle.main , fontName: fontName, fontExtension: fontExtension)
        }
    }
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
