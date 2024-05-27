//
//  ContentView.swift
//  DevCommuToDoApp
//
//  Created by Nattapon Howong on 22/5/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  
  @Environment(\.modelContext) private var context
  @Query private var items: [DataItem]
  @State var number = 0;
  @State var showAddToDoView: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack {
        List {
          Section(header: Text("To Do")){
            ForEach(items.filter { !$0.isCheck }){item in
              TaskRow(item: item)
            }.onDelete{ indexSet in
              print(" Index Set : \(indexSet)")
              for index in indexSet{
                print(" Index : \(index)")
                context.delete(items[index])
              }
            }
          }
          Section(header:Text("Done")){
            ForEach(items.filter { $0.isCheck }){item in
              TaskRow(item: item)
            }.onDelete{ indexSet in
              print(" Index Set : \(indexSet)")
              for index in indexSet{
                print(" Index : \(index)")
                context.delete(items[index])
              }
            }
          }
        }
        .listStyle(.plain)
        .background()
      }//: VSTACK
      .padding()
      .navigationTitle("Remiders")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing){
          Button("Add"){
            print("To Add")
            showAddToDoView.toggle()
          }
        }
      }
      .sheet(isPresented: $showAddToDoView, content: {
        AddToDoView()
          .presentationDetents([.medium, .large])
          .presentationDragIndicator(.visible)
      })
    }//: NAVIGATIONSTACK
  }
  
  
  
  
  func updateitem(_ item: DataItem) {
    item.isCheck = !item.isCheck
    try? context.save()
  }
}

#Preview {
  ContentView()
}
