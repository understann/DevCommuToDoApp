//
//  TaskRow.swift
//  DevCommuToDoApp
//
//  Created by Nattapon Howong on 23/5/2567 BE.
//

import SwiftUI
import SwiftData

struct TaskRow: View {
  @Bindable var item: DataItem
  @Environment(\.modelContext) var context
  
  var body: some View {
    HStack(spacing: 10){
      Image(systemName: item.isCheck ? "checkmark.circle.fill" : "circle")
        .resizable()
        .frame(width: 20, height: 20)
        .foregroundColor(Color.blue)
        .onTapGesture {
          item.isCheck.toggle()
          try? context.save()
        }
      VStack(alignment: .leading) {
        Text(item.name)
          .font(.title3)
          .strikethrough(item.isCheck)
          .foregroundColor(item.isCheck ? .secondary : .primary)
        
        Text(item.dueDate, style: .date)
          .font(.caption)
          .foregroundColor(item.isCheck ? .secondary : .primary)
        
      }
    }
  }
}

