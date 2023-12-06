//
//  AddActivity.swift
//  Habit-Tracker
//
//  Created by Mich balkany on 12/5/23.
//

import SwiftUI

struct AddActivity: View {
    var data: Activities
    
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save") {
                    
                    let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else { return }
                    
                    let activity = Activity(title: trimmedTitle, description: description)
                    data.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
    
}

#Preview {
    AddActivity(data: Activities())
}
