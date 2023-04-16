//
//  SwiftUIView.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 16.04.2023.
//

import SwiftUI

struct ViewModifiersCamp: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("ViewModifiers Nedir ?").bold().font(.title2)
            Text("Viewlere, textlere yada buttonlara attribute\(Text("(özellik)").foregroundColor(.gray)) atamayı biliyoruz. Peki bir sürü text için yada bir sürü view için aynı özelliği atamamız hem kod karmaşıklığı yaratmamız hem de uygulamanın fazladan işlenmesine neden olabilir. Biz de bu yüzden \(Text("ViewModifiers").bold()) özelliği kulanacağız.")
                .font(.caption)
            
            Text("ViewModifiers Örnek").font(.body)
            
            Text("View Modifiers")
                .font(.caption)
                .foregroundColor(.yellow)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.gray)
                }
            Text("View Modifiers")
                .modifier(ViewModifiersCampModifier())
            
            Text("View Modifiers")
                .FuncViewModifiersCampModifier()
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("ViewModifier")
    }
}

struct ViewModifiersCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifiersCamp()
    }
}
//MARK: Modifier haline getirdiğimiz
struct ViewModifiersCampModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.yellow)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
            }
    }
}
//MARK: Extension şeklinde yaptığımız 
extension View {
    func FuncViewModifiersCampModifier() -> some View {
        self
            .modifier(ViewModifiersCampModifier())
    }
}
