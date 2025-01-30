//
//  ShiftHistoryView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/24/25.
//
import SwiftData
import SwiftUI

struct ShiftHistoryView: View {
    @Environment(\.modelContext) var modelContext
    @Query var shifts: [Shift]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(shifts) { shift in
                    NavigationLink {
                        Text("Shift Details View")
                    } label: {
                        HStack {
                            VStack (alignment: .leading){
                                Text(shift.date.formatted(date: .abbreviated, time: .omitted))
                                    .font(.headline)
                                Text("\(shift.members.count) members")
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            Text("$\(Int(shift.totalCash))")
                                .font(.title3)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ShiftHistoryView()
}
