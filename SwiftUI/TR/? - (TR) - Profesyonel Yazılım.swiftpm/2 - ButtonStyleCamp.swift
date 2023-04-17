//
//  ButtonStyleCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 16.04.2023.
//

import SwiftUI

struct ButtonStyleCamp: View {
    var body: some View {
        VStack {
            LazyVStack(alignment: .leading, spacing: 10){
                Text("ButtonStyle Nedir ?").bold().font(.title2)
                Text("Button tarzlarını belirlemek amaçlı yaptığımız bir tarzlardan biridir.")
                    .font(.caption)
                
                Text("ButtonStyle Örnek").font(.body)
                
                Button { }  label: {Text("Button")}
                    .foregroundColor(.blue)
                    .background(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.green)
                            .padding(.all,-10)
                    })
                    .padding(.vertical)
                
                Button { }  label: {Text("Button")}
                    .buttonStyle(ButtonStyleCampStyle())
                    .padding(.vertical)
                
                Button { }  label: {Text("Button")}
                    .FuncButtonStyleCampStyle()
                    .padding(.vertical)
            }
            .padding(.horizontal)
            Spacer()
        }
        .navigationTitle("ButtonStyle")
    }
}

private struct ButtonStyleCampStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.blue)
            .background(content: {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
                    .padding(.all,-10)
            })
        //.scaleEffect (configuration.isPressed ? 0.9 : 1.0)
        //.brightness (configuration.isPressed ? 0.05 : 0)
        //.opacity (configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    
    func FuncButtonStyleCampStyle() -> some View {
        self.buttonStyle(ButtonStyleCampStyle())
    }
}
