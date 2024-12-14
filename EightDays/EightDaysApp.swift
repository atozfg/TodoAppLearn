//
//  EightDaysApp.swift
//  EightDays
//
//  Created by Midhuhath Ibrahim on 12/13/24.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - Data Point
 View - UI
 ViewModel - Manages Model for View
 
 */

@main
struct EightDaysApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
