//
//  Countries.swift
//  BasicCoordinator-Techniques
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct Countries: View {
    
    @EnvironmentObject private var coordinator : Coordinator
    
    var body: some View {
        List {
            Button("Turkey") {
                coordinator.push(.Turkey)
            }
        }
    }
}

struct Countries_Previews: PreviewProvider {
    static var previews: some View {
        Countries()
    }
}
