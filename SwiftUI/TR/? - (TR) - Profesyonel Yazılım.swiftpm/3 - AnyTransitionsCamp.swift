//
//  AnyTransitionsCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 16.04.2023.
//

import SwiftUI

struct AnyTransitionsCamp: View {
    
    @State private var isMove = false
    
    var body: some View {
        VStack {
            LazyVStack(alignment: .leading, spacing: 10){
                Text("AnyTransitions Nedir ?").bold().font(.title2)
                Text("Objeleri hareketli haline getirmek için.")
                    .font(.caption)
                
                Text("AnyTransitions Örnek").font(.body)
                
                if isMove {
                    RoundedRectangle(cornerRadius: 12)
                        .aspectRatio(contentMode: .fit)
                        .transition(AnyTransition.move(edge: .trailing))
                        .frame(height: 100)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .aspectRatio(contentMode: .fit)
                        .transition(AnyTransition.moveFromRight)
                        .frame(height: 100)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .aspectRatio(contentMode: .fit)
                        .transition(AnyTransition.FuncMoveFromRight())
                        .frame(height: 100)
                }
                Button {
                    withAnimation(.easeInOut) {
                        self.isMove.toggle()
                    }
                } label: {
                    Text("Göstermek için")
                }

            }
            .padding(.horizontal)
            Spacer()
        }
        .navigationTitle("AnyTransitions")
    }
}

private struct AnyTransitionsCampModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .transition(AnyTransition.move(edge: .trailing))
    }
}

extension AnyTransition {
    
    static var moveFromRight: AnyTransition {
        return AnyTransition.move(edge: .trailing)
    }
    
    static func FuncMoveFromRight() -> AnyTransition {
        return AnyTransition.move(edge: .trailing)
    }
}
