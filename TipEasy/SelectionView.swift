//
//  SelectionView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/8/25.
//

import SwiftUI

struct SelectionView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var shift: Shift

    var hourSelection = [0,1,2,3,4,5,6,7,8,9,10,11,12]
    @State private var showingSummary = false
    
    var body: some View {
        NavigationStack {
            Section {
                List{
                    ForEach(shift.members.indices, id:\.self) { i in
                        HStack {
                            Text(shift.members[i].fname)
                            Text(shift.members[i].role)
                            Picker("Hours", selection: $shift.members[i].hours) {
                                ForEach(hourSelection, id:\.self) {
                                    Text("\($0)")
                                }
                            }
                        }
                    }
                }
            }
            Section {
                Button("Calculate") {
                    // Do the math
                    Calculation()
                    showingSummary = true
                }
            }
        }
        .sheet(isPresented: $showingSummary) {
            SummaryView(shift: shift)
        }
    }
    
    func Calculation() {
        //Calculating the total Hours for FOH and BOH
        //This could be done onAppear()
        var fHours = 0
        var bHours = 0
        // Another way to consider
        var reducedFoh = shift.members.filter{ $0.role == "Bartender" || $0.role == "Server" }.reduce(0) { partialResult, m in
            partialResult + m.hours
        }
        var reducedBoh = shift.members.filter{ $0.role == "Runner" || $0.role == "Barback" }.reduce(0) { partialResult, m in
            partialResult + m.hours
        }
        print("reduced = \(reducedFoh) & \(reducedBoh)")
        
        for member in shift.members {
            if member.role == "Bartender" || member.role == "Server" {
                fHours += member.hours
            } else {
                bHours += member.hours
            }
        }
        print("F & B = \(fHours + bHours)")
        //print("In total, we had \(fHours) hours for FOH and \(bHours) hours for BOH")
        
        let fHourly = (shift.totalCash * 0.75) / Double(fHours)
        let bHourly = (shift.totalCash * 0.25) / Double(bHours)
        
        for i in shift.members.indices {
            if shift.members[i].role == "Bartender" || shift.members[i].role == "Server" {
                shift.members[i].takeHome = Double(shift.members[i].hours) * fHourly
            } else {
                shift.members[i].takeHome = Double(shift.members[i].hours) * bHourly
            }
        }
        
        for member in shift.members {
            print("\(member.fname) (\(member.role)) walks out with $\(member.takeHome) after working \(member.hours) hours")
        }
        
    }
}

#Preview {
    SelectionView(shift: Shift())
}
