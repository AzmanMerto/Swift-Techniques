//
//  ViewBuilderCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct CustomHStack<Content:View>:View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderCamp: View {
    var body: some View {
        CustomHStack {
            
        }
    }
}

struct ViewBuilderCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderCamp()
    }
}
