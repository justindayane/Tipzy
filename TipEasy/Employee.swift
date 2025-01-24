//
//  Employee.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/7/25.
//

import Foundation
import SwiftData

//
//struct Role {
//    let name: String
//    let description: String
//    let category: String
//}

//This is to identify an individual Employer
@Model
class Employee {
    var id: UUID
    let fname: String
    let lname: String
    let role: String
    var hours: Int
    var takeHome: Double
    
    init(fname: String, lname: String, role: String) {
        self.id = UUID()
        self.fname = fname
        self.lname = lname
        self.role = role
        self.hours = 0
        self.takeHome = 0.0
    }
}

//Staff would contain an array of Employees
//This is to have a class that would contain and array of workers, we had to use class to be able to have it inside one thing and also use it on other views
/*The following class will be save into user default. That process will use 4 main technologies here:
    1 - Adding the Codable protocol to the ExpenseItems so it could be archibed and ready for storage
    2 - Using UserDefaults to save and load that Data easily
    3 - We make a custom Initalizer for our expenses classes so that when we make one expenses object, it loads automatically from UserDefaults
    4 - We will attached a didSet property observer to the "item" property on Expenses so that when an Item is added or removed, it updates UserDefaults right away
// */
//@Observable
//class Staff {
//    var members = [Employee]() {
//        /* This is property observer to add changes to disk whenever they occur. This process takes 4 steps
//            1 - Make a JSONEncoder to convert our data to JSON
//            2 - Use that to try encoding our array into JSON (Could be combine with step 1 in one line of code)
//            3 - Write it out to UserDefaults using a particular Key
//            4 - Make sure the Obejcts we are archiving conform to the codable protocol (ExpenseItem)
//         */
//        didSet {
//            if let encoded = try? JSONEncoder().encode(members) {
//                UserDefaults.standard.set(encoded, forKey: "Team")
//            }
//        }
//    }
//    /*
//     This is the custom initializer. It will do the following:
//        1 - attempt to read the same key from the UserDefault
//        2 - create an instance of JSONDecodeer
//        3 - convert the data from UserDefault into an array of ExpenseItem objects
//        4 a - if it worked, put it into our items array
//        4 b - if it did not work, make an empty array
//     */
//    init() {
//        if let savedData = UserDefaults.standard.data(forKey: "Team") {
//            //If we can read savedItems, can we then decode them? (we use .self to refer to the type that we are decoding into
//            if let decoded = try? JSONDecoder().decode([Employee].self, from: savedData) {
//                members = decoded
//                return
//            }
//        }
//        //if any of the previous process failed, create an empty array because it would be the first time
//        members = []
//    }
//}

@Model
class Shift {
    //var date: Date
    var members = [Employee]()
    var totalHours: Int = 0
    var hourlyFOH: Double = 1
    var hourlyBOH: Double = 1
    var totalCash: Double = 0
    
    init(members: [Employee] = [Employee](), totalHours: Int = 0, hourlyFOH: Double = 1, hourlyBOH: Double = 1, totalCash: Double = 0) {
        //self.date = .now
        self.members = members
        self.totalHours = totalHours
        self.hourlyFOH = hourlyFOH
        self.hourlyBOH = hourlyBOH
        self.totalCash = totalCash
    }
}



