//
//  ContentView.swift
//  5 - (TR) - CoreData İlişkiler
//
//  Created by Mert Türedü on 29.07.2023.
//

import SwiftUI
import CoreData

class CoreDataManager: ObservableObject {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        self.container = NSPersistentContainer(name: "Restaurant")
        self.container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
            }
        }
        context = container.viewContext
    }
    
    func save() {
        
        do {
            try context.save()
            print("Saved")
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
}

class ContentViewViewModel: ObservableObject {
    
    var instance = CoreDataManager.instance
    @Published var foodie: [FoodEntity] = []
    @Published var drinko: [DrinkEntity] = []
    @Published var collationo: [CollationEntity] = []
    init() {
        getFood()
        getDrink()
        getCollation()
    }
    
    
    // --
    
    func getFood() {
        let request = NSFetchRequest<FoodEntity>(entityName: "FoodEntity")
        
        do {
            self.foodie = try instance.context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getDrink() {
        let request = NSFetchRequest<DrinkEntity>(entityName: "DrinkEntity")
        
        do {
            self.drinko = try instance.context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getCollation() {
        let request = NSFetchRequest<CollationEntity>(entityName: "CollationEntity")
        
        do {
            self.collationo = try instance.context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // --
    
    func addFood() {
        let newFood = FoodEntity(context: instance.context)
        
        newFood.name = "Kebab"
        newFood.drink = []
        save()
    }
    
    func addDrink() {
        let newDrink = DrinkEntity(context: instance.context)
        newDrink.name = "Cola"
        newDrink.food = [foodie[0]]
        newDrink.addToCollation(collationo[1])
        save()
        
    }
    
    
    func addCollation() {
        let newCollation = CollationEntity(context: instance.context)
        newCollation.calories = 135
        newCollation.name = "nuts"
        newCollation.lastUsing = Date()
        
        newCollation.food = foodie[0]
        newCollation.drink = drinko[0]
        save()
    }
    
    // --
    
    func save() {
        foodie.removeAll()
        drinko.removeAll()
        collationo.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.instance.save()
            self.getFood()
            self.getDrink()
            self.getCollation()
        }
    }
    
}

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Button {
                        viewModel.addCollation()
                    } label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.foodie) { food in
                                FoodView(entity: food)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.drinko) { drink in
                                DrinkView(entity: drink)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.collationo) { collation in
                                CollationView(entity: collation)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Restaurant")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FoodView: View {
    
    let entity: FoodEntity
    
    var body: some View {
        VStack {
            Text(entity.name ?? "")
                .bold()
            
            if let drink = entity.drink?.allObjects as? [DrinkEntity] {
                Text("Drink")
                ForEach(drink) { drinko in
                    Text(drinko.name ?? "")
                }
            }
            
            if let collation = entity.collation?.allObjects as? [CollationEntity] {
                Text("Collation")
                ForEach(collation) { collationo in
                    Text(collationo.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300,alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct DrinkView: View {
    
    let entity: DrinkEntity
    
    var body: some View {
        VStack {
            Text(entity.name ?? "")
                .bold()
            
            if let food = entity.food?.allObjects as? [FoodEntity] {
                Text("Food")
                ForEach(food) { foodie in
                    Text(foodie.name ?? "")
                }
            }
            
            if let collation = entity.collation?.allObjects as? [CollationEntity] {
                Text("Collation")
                ForEach(collation) { collationo in
                    Text(collationo.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300,alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct CollationView: View {
    
    let entity: CollationEntity
    
    var body: some View {
        VStack {
            Text(entity.name ?? "")
                .bold()
            
            Text("Food")
                .bold()
            
            Text(entity.food?.name ?? "")
            
            Text("Drink")
                .bold()
            
            Text(entity.drink?.name ?? "")
            
        }
        .padding()
        .frame(maxWidth: 300,alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
