//
//  Turkey.swift
//  BasicCoordinator-Techniques
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct Turkey: View {
    
    @EnvironmentObject private var coordinator : Coordinator
    
    var body: some View {
        List {
            Button {
                coordinator.present(sheet: .TurkeyDescription)
            } label: {
                Text("Turkey Description")
            }
            Button {
                coordinator.present(fullScreen: .TurkeyPhoto)
            } label: {
                Text("Turkey Photo")
            }
        }
    }
}

struct Turkey_Previews: PreviewProvider {
    static var previews: some View {
        Turkey()
    }
}
