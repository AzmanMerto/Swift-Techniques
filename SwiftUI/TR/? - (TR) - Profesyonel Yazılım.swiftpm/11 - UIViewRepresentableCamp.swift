//
//  UIViewRepresentableCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 24.04.2023.
//

import SwiftUI

struct UIViewRepresentableCamp: View {
    
    @State var text: String = ""
    
    var body: some View {
        TextfieldUIViewRepresentable(text: $text)
            .updatePlaceholder("aodkaosd")
    }
}

struct UIViewRepresentableCamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableCamp()
    }
}


struct BasicUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct TextfieldUIViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder : String
    let placeholderColor: UIColor
    
    init(text: Binding<String>,
         placeholder: String = "Type Something...",
         placeholderColor: UIColor = .gray) {
        self._text = text
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = getTextField()
        textfield.delegate = context.coordinator
        return textfield
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    func updatePlaceholder(_ text: String) -> TextfieldUIViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeholder = text
        return viewRepresentable
    }
    
    private func getTextField() -> UITextField {
        let textfield = UITextField()
        let placeholder = NSAttributedString(string: placeholder,
                                             attributes: [
                                                .foregroundColor : placeholderColor
                                             ])
        textfield.attributedPlaceholder = placeholder
        return textfield
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}
