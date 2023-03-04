//
//  Text Özellikleri.swift
//  2 - (TR) - Swift Temel Yapılar
//
//  Created by NomoteteS on 23.02.2023.
//

import SwiftUI

struct TextOzellikleri: View {
    
    // Burada genellikle kullandığımız özellikleri size gösterip kendi projelerinizde nasıl kullanabileceğiniz hakkında fikir olacak. Şimdi Text e ne gibi özellikler verdiğimizi gösteriyoruz.
    
    var body: some View {
        VStack {
            Text("Herhangi bir yazı")
            // .foregroundColor() Yazının rengini belirlemek için kullanırız.
                .foregroundColor(.blue) // .blue , .black , .red vb.
            // .font() Yazının tipini belirlemek için
                .font(.system(.caption2,design: .rounded)) // .system() .callout vb.
                
        }
    }
}

struct TextOzellikleri_Previews: PreviewProvider {
    static var previews: some View {
        TextOzellikleri()
    }
}
