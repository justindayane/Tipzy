//
//  ExtraView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/8/25.
//

import SwiftUI

//All the extra stuff would be kept here along with future work or ideas
struct ExtraView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink {
                    Text("This feature has yet to be implemented")
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height:100)
                        Text("Add Roles")
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                NavigationLink {
                    Text("This feature has yet to be implemented")
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height:100)
                        Text("Shifts Archive")
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                NavigationLink {
                    Text("This feature has yet to be implemented")
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height:100)
                        Text("Custom Split System")
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                NavigationLink {
                    Text("These categories (ie: FOH, BOH) could be used to list things in a more organized way when selecting staff member of a shift")
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height:100)
                        Text("Create categories")
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                NavigationLink {
                    VStack {
                        Text("Consider using a ScrollView to show the list of employees")
                        Text("Consider adding a list of Employees as a JSON file for demo or testing purposes. That could also be used as a practice of the Bundle-Decode from Project 8 of 100DaysofSwiftUI")
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height:100)
                        Text("Notes")
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                .navigationTitle("Extra Features")
            }
        }
    }
}

#Preview {
    ExtraView()
}
