//
//  ContentView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/7/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            NavigationLink {
//                Text("This is where we will being seeing the whole staff list and add to the list if needed")
                EmployeeView()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 300, height:100)
                    Text("Employee List")
                        .foregroundStyle(.white)
                }
                .padding()
            }
            NavigationLink {
                ShiftView()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 300, height:100)
                    Text("Current Shift")
                        .foregroundStyle(.white)
                }
                .padding()
            }
            NavigationLink {
                ExtraView()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 300, height:100)
                    Text("Other Features")
                        .foregroundStyle(.white)
                }
                .padding()
            }
            .navigationTitle("TipZy")
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
