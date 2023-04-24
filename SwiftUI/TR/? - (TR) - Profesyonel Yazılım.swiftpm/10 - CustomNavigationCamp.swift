//
//  CustomNavigationCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 24.04.2023.
//

import SwiftUI

struct CustomNavigationCamp: View {
    var body: some View {
        customNavigationContainer {
            Color.orange.ignoresSafeArea()
            NavigationLink {
                Text("Pressed")
            } label: {
                Text("Press me")
            }

        }
    }
}

struct CustomNavigationCamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationCamp()
    }
}


struct customNavigationBar: View {
    
    var body: some View {
        HStack {
            navButton
            Spacer()
            navTitleCollection
            Spacer()
        }
        .padding(.horizontal)
    }
}

extension customNavigationBar {
    private var navTitleCollection: some View {
        VStack {
            Text("Title")
                .font(.title3)
            Text("Subtitle")
                .font(.footnote)
        }
    }
    
    private var navButton: some View {
        Button {
            
        } label: {
            Image(systemName: "arrowshape.left.fill")
        }
    }
    
}

struct customNavigationContainer<Content: View> : View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                customNavigationBar()
                ZStack {
                    content
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}

