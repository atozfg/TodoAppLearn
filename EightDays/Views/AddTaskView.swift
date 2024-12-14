//
//  AddTaskView.swift
//  EightDays
//
//  Created by Midhuhath Ibrahim on 12/13/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var taskText: String = ""
    
    @State private var errorAlert: Bool = false
    @State private var errorAlertMessage: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                TextField("Task", text: $taskText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray6))
                    )
                
                Button (action: saveTask,  label: {
                    Text ("Save")
                        .foregroundStyle(.white)
                        .font(.callout)
                        .padding()
                        .frame(width: 150)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.green)
                        )
                        
                })
                

            }
            .padding()
        }
        .navigationTitle("Add Task")
        .alert(isPresented: $errorAlert) {
            errorAlert(errorAlertMessage: "Enter your task")
        }
    }
    
    func saveTask() {
        
        if taskText.count > 0 {
            listViewModel.addTask(title: taskText)
            presentationMode.wrappedValue.dismiss()
        } else {
            errorAlert = true
        }
    }
    
    func errorAlert(errorAlertMessage: String) -> Alert {
        Alert(title: Text("Error"), message: Text(errorAlertMessage))
    }
    
}

#Preview {
    NavigationStack {
        AddTaskView()
    }
    .environmentObject(ListViewModel())
}
