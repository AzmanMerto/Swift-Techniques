//
//  UIViewControllerRepresentableCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 25.04.2023.
//

import SwiftUI

struct UIViewControllerRepresentableCamp: View {
    
    @State private var showScreen: Bool = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            }
            
            Button {
                showScreen.toggle()
            } label: {
                Text("Click it")
            }
        }
        .sheet(isPresented: $showScreen) {
            UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
    }
    }
}


struct UIViewControllerRepresentableCamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRepresentableCamp()
    }
}

//MARK: ImagePicker -

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Environment(\.presentationMode) var presentionMode
        @Binding var image: UIImage?
        @Binding var showScreen: Bool
        
        init(image: Binding<UIImage?>,
             showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            image = newImage
            showScreen.toggle()
        }
    }
}

//MARK: View -

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class MyFirstViewController: UIViewController {
        
        var labelText: String = "Value"
        
        override func viewDidLoad() {
             super.viewDidLoad()
            
            view.backgroundColor = .blue
            
            let label = UILabel()
            label.text = labelText
            label.textColor = .white
            
            view.addSubview(label)
            label.frame = view.frame
            
        }
        
    }
    
}


