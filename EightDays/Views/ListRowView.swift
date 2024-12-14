//
//  ListRowView.swift
//  EightDays
//
//  Created by Midhuhath Ibrahim on 12/13/24.
//

import SwiftUI

struct ListRowView: View {
    
    var task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle" )
                .foregroundStyle(task.isCompleted ? .green : .primary)

            Text(task.title)
                .strikethrough(task.isCompleted)
                .animation(.spring(), value: task.isCompleted)
            
            
            Spacer()
        }
    }

}

#Preview {
    ListRowView(task: TaskModel(title: "Laundry", isCompleted: false))
}
