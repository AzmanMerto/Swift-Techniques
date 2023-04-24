//
//  PreferenceKeyCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct PreferenceKeyCamp: View {
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                secondryScreen(oldText: text)
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

struct PreferenceKeyCamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyCamp()
    }
}

struct secondryScreen: View {
    
    let oldText: String
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(oldText)
                .onAppear(perform: GetDataFromDatabase)
                .customTitle(text)
        }
    }
    
    func GetDataFromDatabase() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.text = "DATA DOWNLOADED"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
    static var defaultValue: String = ""
    
    
}


extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}


//MARK: -

struct GeometryPreferenceKeyBootcamp: View {
    @State private var rectSize: CGSize = .zero
    var body: some View {
        VStack {
            Text ("Hello, world!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background (Color.blue)
            Spacer()
            HStack {
                Rectangle ()
                GeometryReader { geo in
                    Rectangle ()
                        .updateRectengleGeoSize(geo.size)
                }
                Rectangle()
            }
            .frame (height: 55)
        }
        .onPreferenceChange (RectangleGeometrySizePreferenceKey.self, perform: { value in
            self.rectSize = value
        })
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce (value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
        
    }
}


extension View {
    func updateRectengleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}
