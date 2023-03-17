//
//  TurkeyPhotos.swift
//  BasicCoordinator-Techniques
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct TurkeyPhotos: View {
    
    @EnvironmentObject private var coordinator : Coordinator
    
    var body: some View {
        List {
            Button("Dismiss") {
                coordinator.dismissFullScreenCover()
            }
        }
    }
}

struct TurkeyPhotos_Previews: PreviewProvider {
    static var previews: some View {
        TurkeyPhotos()
    }
}
