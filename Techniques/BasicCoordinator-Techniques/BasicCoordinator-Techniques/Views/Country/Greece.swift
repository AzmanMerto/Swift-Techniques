//
//  Greece.swift
//  BasicCoordinator-Techniques
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct Greece: View {
    
    @EnvironmentObject private var coordinator : Coordinator
    
    var body: some View {
        Text("Greece")
    }
}

struct Greece_Previews: PreviewProvider {
    static var previews: some View {
        Greece()
    }
}
