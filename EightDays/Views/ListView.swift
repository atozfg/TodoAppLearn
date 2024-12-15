//
//  ListView.swift
//  EightDays
//
//  Created by Midhuhath Ibrahim on 12/13/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewModel: ListViewModel
    @State private var showAddTaskSheet: Bool = false
    
    var body: some View {
        
        if listviewModel.tasks.isEmpty {
            ContentUnavailableView("Nothing much to do here", systemImage: "sparkles" , description: Text("add tasks and get things done now!"))
        }
        
        List {
            ForEach(listviewModel.tasks) { item in
                ListRowView(task: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listviewModel.updateTask(task: item)
                        }
                    }
            }
            .onDelete(perform: listviewModel.deleteTask)
            .onMove(perform: listviewModel.moveTask)
        }
                
        .safeAreaInset(edge:.bottom , content: {
            
            HStack {
                
                Button("Add Task Here") {
                    showAddTaskSheet.toggle()
                }
                
                Button {
                    showAddTaskSheet.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(
                            RadialGradient(colors: [.yellow, .orange,], center: .topLeading, startRadius: 20, endRadius: 50)
                        )
                }
                
                
                //            NavigationLink(destination: AddTaskView(), label: {
                //                Image(systemName: "plus.circle.fill")
                //                    .font(.largeTitle)
                //                    .foregroundStyle(.green)
                //            })
                
            }
        })

        .listStyle(.plain)
        .navigationTitle("To-do List 😎")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                EditButton()
            }
        }
        
        .sheet(isPresented: $showAddTaskSheet, content: {
            NavigationStack {
                AddTaskView()
                    .presentationDetents([.medium])
            }
            })
        
        
    }
}


#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}


