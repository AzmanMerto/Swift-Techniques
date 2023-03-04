//
//  Örnek.swift
//  2 - (TR) - Swift Temel Yapılar
//
//  Created by NomoteteS on 22.02.2023.
//

import SwiftUI

struct Stacking: View {
    
    // Stackleri objeleri yerleştirmek için kullanırız.
    // MARK: (ZStack) En alttaki en üstde olacak şekilde dizilim oluşur.
    // MARK: (HStack) En soldan en sağa olacak şekilde dizilim oluşur.
    // MARK: (VStack) En üstten en alt tarafa olacak şekilde dizilim oluşur.
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.pink)
                .frame(width: 360,
                       height: 250)
            VStack {
                Text("Daireler")
                HStack(spacing: 10) { // Spacing yerleşitirdiğin objeleri boşluk vermeni sağlar.
                    Circle()
                        .frame(width: 100)
                    Circle()
                        .frame(width: 100)
                    Circle()
                        .frame(width: 100)
                }
                .foregroundColor(.green)
                HStack {
                    Circle()
                        .frame(width: 70)
                    Circle()
                        .frame(width: 70)
                    Circle()
                        .frame(width: 70)
                }
                .foregroundColor(.orange)
            }
        }
    }
}

struct Stacking_Previews: PreviewProvider {
    static var previews: some View {
        Stacking()
    }
}
