//
//  SelectionView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/8/25.
//

import SwiftUI

struct SelectionView: View {
    
    @Bindable var shift: Shift
    var staff: Staff

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
        for member in shift.members {
            if member.role == "Bartender" || member.role == "Server" {
                fHours += member.hours
            } else {
                bHours += member.hours
            }
        }
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
        // Foh would have to be based on 75% of the money
        // Boh 25%
        // Foh Hourly would require knowing the total hours foh
        // Hoh Hoursly would require knowing the total hours boh
    }
}

#Preview {
    SelectionView(shift: Shift(), staff: Staff())
}
