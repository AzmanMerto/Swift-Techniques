//
//  Tuyolar.swift
//  2 - (TR) - Swift Temel Yapılar
//
//  Created by NomoteteS on 23.02.2023.
//

import SwiftUI

struct Tuyolar: View {
    var body: some View {
        Text("Tüyolar")
    }
}

struct Tuyolar_Previews: PreviewProvider {
    static var previews: some View {
        Tuyolar()
            .previewDevice("iPhone 11") // Similasyonun modelini ayarlamak için
            .preferredColorScheme(.dark) // Similasyonun rengini ayarlamak için
            .previewInterfaceOrientation(.landscapeLeft) // Yan tarafa çevirmek için
    }
}
