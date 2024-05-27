//
//  AddToDoView.swift
//  DevCommuToDoApp
//
//  Created by Nattapon Howong on 23/5/2567 BE.
//

import SwiftUI
import SwiftData

struct AddToDoView: View {
  //MARK: - Property
  
  @Environment(\.modelContext) var context
  @Environment(\.dismiss) var dismiss
  @State private var newItem = DataItem()
  
  //MARK: - Body
    var body: some View {
      NavigationStack{
        List{
          TextField("name",text: $newItem.name)
          DatePicker("date", selection: $newItem.dueDate, displayedComponents: .date)
        }
        .navigationTitle("Add ToDo")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
          ToolbarItem(placement: .topBarLeading){
            Button("Cancle"){
              dismiss()
            }
          }
          ToolbarItem(placement: .topBarTrailing){
            Button("Add"){
              context.insert(newItem)
              dismiss()
            }
          }
        }
      }
    }
  
}

#Preview {
    AddToDoView()
}
