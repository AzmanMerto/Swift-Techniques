//
//  AdvancedCombineCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 27.04.2023.
//

import SwiftUI
import Combine


class AdvancedCombineDataServer {
    
    //@Published var basicPublisher: String = ""
    //    var currentValuePublisher = CurrentValueSubject<String,Never>("")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishedFakeData()
    }
    
    private func publishedFakeData() {
        let items = Array(0..<11)
        
                for x in items.indices {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
        //            self.basicPublisher = items[x]
        //            self.currentValuePublisher.send(items[x])
                        self.passThroughPublisher.send(items[x])
                        if (x > 4 && x < 8) {
                            self.boolPublisher.send(true)
                            self.intPublisher.send(999)
                        } else {
                            self.boolPublisher.send(false)
                        }
                        if x == items.indices.last {
                            self.passThroughPublisher.send(completion: .finished)
                        }
                }
            }
        
        //Timer İçin/DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
        //Timer İçin/    self.passThroughPublisher.send(1)
        //Timer İçin/}
        //Timer İçin/DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        //Timer İçin/    self.passThroughPublisher.send(2)
        //Timer İçin/}
        //Timer İçin/DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        //Timer İçin/    self.passThroughPublisher.send(3)
        //Timer İçin/}
    }
}

class AdvancedCombineCampViewModel: ObservableObject {
    
    @Published var data : [String] = []
    @Published var dataBools: [Bool] = []
    @Published var error : String?
    let dataService = AdvancedCombineDataServer()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    
    private func addSubscribers() {
        //dataService.$basicPublisher
        //dataService.currentValuePublisher
        //dataService.passThroughPublisher
        
        // Sequence Operations //
        /*
         //.first()
         //.first(where: { $0 > 4  })
         //.tryFirst(where: { int in
         //    if int == 3 {   throw URLError(.badServerResponse)   }
         //    return int > 1  })
         //.last()
         //.last(where: {$0 < 4})
         //.tryLast(where: { Int in
         //    if Int == 13 {
         //        throw URLError(.badServerResponse)
         //    }
         //    return Int > 1
         //})
         //.dropFirst()
         //.drop(while: { $0 < 3 })
         //.tryDrop(while: { Int in
         //    if Int == 15 {
         //        throw URLError(.badServerResponse)
         //    }
         //    return Int < 6
         //})
         //.prefix(4)
         //.prefix(while: { $0 < 5 })
         //.tryPrefix(while: { Int in
         //    if Int == 2 {
         //        throw URLError(.badServerResponse)
         //    }
         //    return Int < 1
         //})
         //.output(at: 0)
         //.output(in: 2..<4)
         */
        // Mathmatic Operations //
        /*
         //Filtering / Reducing Operations//
         //.max()
         //.max(by: { int1, int2 in
         //    return int1 < int2
         //})
         //.min()
         //.min(by: { int1, int2 in
         //    return int1 < int2
         //})
         //.tryMin(by: { int1, int2 in
         //    return int1 < int2
         //})
         */
        // Filter / Reducing Operations
        /*
         //.map({ String($0})
         //.tryMap({ int in
         //    if int == 5 {   throw URLError(.badServerResponse)  }
         //    return String(int)  })
         //.compactMap({ int in
         //    if int == 5 {   return nil }
         //    return String(int)  })
         //.filter({ ($0 > 3) && ($0 < 7)})
         //.removeDuplicates() // Tekrarlanan objeleri silmek için
         //.removeDuplicates(by: { int1, int2 in
         //    return int1 == int2 }) // Bir önceki değeri hesap alarak siliyor
         //.replaceNil(with: 5)
         //.replaceEmpty(with: 5)
         //.replaceError(with: 0)
         //.scan(1, { existingValue, newValue in
         //    return existingValue + newValue })
         //.scan(0, { $0 + $1 })
         //.scan(0, +)
         //.tryScan()
         //.reduce(0, { existinValue, newValue in
         //    return existinValue + newValue })
         //.reduce(0, +)
         //.collect() // Data hepsi gelince code çalışması sağlar
         //.collect(3) // Datayı 3er 3er gelince tamamlar
         //.allSatisfy({ $0 < 50}) // Boolean şekilde döndürür data belirlediğimiz şekilde ise devam ettirir.
         */
        //Timing Operations
        /*
            //.debounce(for: 0, scheduler: DispatchQueue.main) // Bekletme arkada
            //.delay(for: 2, scheduler: DispatchQueue.main) // Zaman boşluğu bırakma
            //.measureInterval(using: DispatchQueue.main)
            //.throttle(for: 10, scheduler: DispatchQueue.main, latest: false) // en son veriyi yada daha sonrasındaki veriyi ortaya getirmek için
            //.retry(10) // Tekrardan denemek için
            //.timeout(0.75, scheduler: DispatchQueue.main)
         */
        //Multiple Publishers / Subscribers
        /*
            //.combineLatest(dataService.boolPublisher, dataService.intPublisher)
            //.compactMap({ (int, bool) in
            //    if bool { return String(int)  }
            //    return nil })
            //.compactMap({$1 ? String($0) : nil})
            //.compactMap({ (int1, bool, int2) in
            //    if bool {  return String(int1)}    return nil   })
            //.merge(with: dataService.intPublisher) // Datayı birleştirmek için
            //.zip(dataService.boolPublisher) // Publisheri birleştirmek için
            //.map({ tuple in return String(tuple.0) + tuple.1.description }) // Zip de bu şekiLde kullanılıyor.
            //.tryMap({ int in  if int == 5 {   throw URLError(.badServerResponse) }; return int  }) //Catch için
            //.catch({ error in   return self.dataService.intPublisher   }) Hata yakalayınca
         */
        
        let sharedPublisher = dataService.passThroughPublisher
            .dropFirst(3)
            .share()
        
        sharedPublisher
            .map({String($0)})
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "Error = \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)
        
        sharedPublisher
            .map({$0 > 5 ? true : false})
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "Error = \(error.localizedDescription)"
                }
            } receiveValue: { [weak self] returnedValue in
                self?.dataBools.append(returnedValue)
            }
            .store(in: &cancellables)
    }
}

struct AdvancedCombineCampView: View {
    
    @StateObject var viewModel: AdvancedCombineCampViewModel = .init()
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    ForEach(viewModel.data, id: \.self) {
                        Text($0)
                            .font(.title).bold()
                            .foregroundColor(.black)
                    }
                    if let error = viewModel.error {
                        Text(error)
                    }
                }
                VStack {
                    ForEach(viewModel.dataBools, id: \.self) {
                        Text($0.description)
                    }
                }
            }
        }
    }
}

struct AdvancedCombineCamp_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombineCampView()
    }
}
