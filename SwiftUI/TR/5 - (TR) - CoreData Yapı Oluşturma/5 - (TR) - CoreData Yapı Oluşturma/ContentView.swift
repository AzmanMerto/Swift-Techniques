//
//  ContentView.swift
//  5 - (TR) - CoreData Yapı Oluşturma
//
//  Created by Mert Türedü on 28.07.2023.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    var savedEntitys: [Country] = []
    
    init() {
        self.container = NSPersistentContainer(name: "CountryName")
        self.container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("successfully")
            }
        }
        
        fetchCountrys()
    }
    
    func fetchCountrys() {
        let request = NSFetchRequest<Country>(entityName: "Country")
        
        do {
            savedEntitys = try container.viewContext.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteCountry(indexSet: IndexSet) {
        
    }
    
    func addCountry(text: String) {
        let newCountry = Country(context: container.viewContext)
        newCountry.name = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCountrys()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

struct ContentView: View {
    
    @StateObject var viewModel = CoreDataViewModel()
    @State var textFieldString: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                //Textfield
                TextField("addFruit", text: $textFieldString)
                    .font(.headline)
                    .background(Color(.gray))
                //Button
                Button("Add") {
                    viewModel.addCountry(text: textFieldString)
                }
                .buttonStyle(.bordered)
                .foregroundColor(.blue)
                
                List {
                    ForEach(viewModel.savedEntitys) { entitys in
                        Text(entitys.name ?? "NO NAME")
                            .foregroundColor(.white)
                    }
                    .onDelete(perform: viewModel.deleteCountry)
                }
                Spacer()
            }
        }
        .navigationTitle("Countrys")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
