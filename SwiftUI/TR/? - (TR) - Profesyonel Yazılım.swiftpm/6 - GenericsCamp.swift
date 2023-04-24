//
//  Generics.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct GenericModel<T> {
    var info: T?
    
    func removeInfo() -> GenericModel{
        GenericModel(info: nil)
    }
}

class GenericsCampViewModel: ObservableObject {
    
    @Published var genericModel = GenericModel(info: "Info")

    func removeData() {
        genericModel = genericModel.removeInfo()
    }
}

struct GenericsCamp: View {
    
    @StateObject var viewModel = GenericsCampViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.genericModel.info ?? "No Data")
                .onTapGesture {
                    viewModel.removeData()
                }
        }
    }
}
