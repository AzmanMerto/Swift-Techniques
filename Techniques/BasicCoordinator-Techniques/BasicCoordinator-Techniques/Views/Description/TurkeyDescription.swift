//
//  TurkeyDescription.swift
//  BasicCoordinator-Techniques
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct TurkeyDescription: View {
    
    @EnvironmentObject private var coordinator : Coordinator
    
    var body: some View {
        List {
            Text("Turkey Description")
            Button("Dismiss") {
                coordinator.dismissSheet()
            }
            
            Button("alternative dismiss") {
                coordinator.pop()
            }
            
            Button("Direct Root View") {
                coordinator.popToRoot()
            }
        }
        
    }
}

struct TurkeyDescription_Previews: PreviewProvider {
    static var previews: some View {
        TurkeyDescription()
    }
}
