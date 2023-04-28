//
//  ProtocolCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 25.04.2023.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondry: Color = .white
    let tertiary: Color = .gray
}

class AlternativeTheme: ObservableObject,CollectionProtocol {
    var text: String
    
    init(text: String = "Hey init in text") {
        self.text = text
    }
    
    let primary: Color = .blue
    let secondry: Color = .white
    let tertiary: Color = .gray
}

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondry: Color { get }
    var tertiary: Color { get }
}

protocol TextProtocol {
    var text: String { get }
}

protocol CollectionProtocol: ColorThemeProtocol, TextProtocol {
    
}

struct ProtocolCamp: View {
    
    let theme: CollectionProtocol = AlternativeTheme()
    
    var body: some View {
        Text(theme.text)
    }
}

struct ProtocolCamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolCamp()
    }
}
