//
//  ContentView.swift
//  KewlBeans
//
//  Created by admin on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var history = History()
    @State private var showingAddScreen = false

    var totalCaffine: Int {
        history.servings.map(\.caffine).reduce(0, +)
    }

    var totalCalories: Int {
        history.servings.map(\.calories).reduce(0, +)
    }

    var body: some View {
        NavigationView {
            List {
                if history.servings.isEmpty {
                    Button("Add your first drink") {
                        showingAddScreen = true
                    }
                } else {
                    Section("Summary") {
                        Text("Caffine: \(totalCaffine)mg")
                        Text("Calories: \(totalCalories)")
                    }

                    ForEach(history.servings) { serving in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(serving.name)
                                    .font(.headline)

                                Text(serving.description)
                                    .font(.caption)
                            }

                            Spacer()

                            Text("\(serving.caffine)mg")
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    history.delete(serving)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }

                            Button {
                                withAnimation {
                                    history.reorder(serving)
                                }
                            } label: {
                                Label("Repeat", systemImage: "repeat")
                            }
                            .tint(.blue)
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: MenuView.init)
            .navigationTitle("Kewl Beans")
            .toolbar {
                Button {
                    showingAddScreen = true
                } label: {
                    Label("Add New Drink", systemImage: "plus")
                }
            }
        }
        .environmentObject(menu)
        .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
