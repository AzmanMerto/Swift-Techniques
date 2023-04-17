//
//  MatchedGeometryEffect.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 16.04.2023.
//

import SwiftUI

struct MatchedGeometryEffectCamp: View {
    
    let animals: [String] = ["cat","dog","bird"]
    @State private var isClicked: Bool = false
    @State private var selected: String = ""
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            LazyVStack(alignment: .leading, spacing: 10){
                Text("AnyTransitions Nedir ?").bold().font(.title2)
                Text("Bir animasyon gibi oynatmak için.")
                    .font(.caption)
                
                Text("MatchedGeometryEffect Örnek").font(.body)
                
                HStack {
                    ForEach(animals, id: \.self) { animals in
                        ZStack {
                            if selected == animals {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.blue.opacity(0.2))
                                    .matchedGeometryEffect(id: "animals", in: namespace)
                            }
                            Text(animals)
                                .frame(maxWidth: .infinity)
                        }
                        .onTapGesture {
                            withAnimation {
                                selected = animals
                            }
                        }
                        .padding(.all)
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .navigationTitle("MatchedGeometryEffect")
    }
}
