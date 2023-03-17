//
//  Coordinator.swift
//  BasicCoordinator-Techniques
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

enum Pages: String, Identifiable {
    case Countries,Turkey,Cyprus,Greece
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case TurkeyDescription,CyprusDescription,GreeceDescription
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case TurkeyPhoto,CyprusPhoto,GreecePhoto
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreen: FullScreenCover?
    
    func push(_ page: Pages) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreen: FullScreenCover) {
        self.fullScreen = fullScreen
    }
    
    func pop() {
        path.removeLast() 
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreen = nil
    }
    
    @ViewBuilder
    func build(page: Pages) -> some View {
        NavigationStack{
            switch page {
            case .Turkey:
                Turkey()
            case .Cyprus:
                Cyprus()
            case .Greece:
                Greece()
            case .Countries:
                Countries()
            }
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        NavigationStack{
            switch sheet {
            case .TurkeyDescription:
                TurkeyDescription()
            case .CyprusDescription:
                CyprusDescription()
            case .GreeceDescription:
                GreeceDescription()
            }
        }
    }
    
    @ViewBuilder
    func build(fullscreen: FullScreenCover) -> some View {
        NavigationStack{
            switch fullscreen {
            case .TurkeyPhoto:
                TurkeyPhotos()
            case .CyprusPhoto:
                CyprusPhotos()
            case .GreecePhoto:
                GreecePhotos()
            }
        }
    }
}
