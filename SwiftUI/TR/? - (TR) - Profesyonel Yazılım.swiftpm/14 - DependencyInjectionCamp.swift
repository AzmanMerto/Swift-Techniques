//
//  DependencyInjectionCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 25.04.2023.
//

import SwiftUI
import Combine

//MARK: - Model Oluşturup Datayı EnCodable şekilde çekebilmek için
struct PostModel: Identifiable, Decodable {
    let userId, id: Int?
    let title, body: String?
}

protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostModel], Error>
}

class ProductionDataService: DataServiceProtocol {
        
    let url: URL
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionCampViewModel: ObservableObject {
    @Published var dataArray: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadData()
    }
    
    func loadData() {
        dataService.getData()
            .sink { _ in
            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionCamp: View {
    
    @StateObject var viewModel : DependencyInjectionCampViewModel
    
    
    init(dataService: DataServiceProtocol) {
        _viewModel = StateObject(wrappedValue: DependencyInjectionCampViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray) { data in
                    Text(String(data.id!))
                    Text(data.title!)
                }
            }
        }
    }
}

struct DependencyInjectionCamp_Previews: PreviewProvider {
    
//    static let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    
    static let dataService = MockDataService(data: nil)
    
    static var previews: some View {
        DependencyInjectionCamp(dataService: dataService)
    }
}


class MockDataService: DataServiceProtocol {
    
    let testData: [PostModel]
    
    init(data: [PostModel]? ) {
        self.testData = data ?? [
            PostModel(userId: 1, id: 1, title: "One", body: "one"),
            PostModel(userId: 2, id: 2, title: "Two", body: "two")
            ]
    }
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}
