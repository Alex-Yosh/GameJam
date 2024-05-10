//
//  TimerManager.swift
//  GameJam
//
//  Created by Alex Yoshida on 2024-05-10.
//

import Foundation

final class TimerManager: ObservableObject{
    static let shared = TimerManager() //singleton
    
    
    @Published var hour: Int = 0
    @Published var minute: Int = 0
    @Published var second: Int = 0
    
    var endDate: Date = Date()
    
    
    var hasCountdownCompleted: Bool {
        Date.now > endDate
    }
    
    func startTimer(){
//        endDate = endDate.startOfNextDay
        
        //for testing
        if (DatabaseManager.shared.user.endDate > Date.now){
            endDate = DatabaseManager.shared.user.endDate
        }else{
            endDate = Date.now.addingTimeInterval(10)
        }
        
        //store endtime
        DatabaseManager.shared.user.endDate = endDate
        DatabaseManager.shared.saveUser()
        
        GameManager.shared.overlay = .coolDown
        
        updateTimer()
    }
    
    func updateTimer() {
        let calendar = Calendar(identifier: .gregorian)
        let timeValue = calendar.dateComponents([.hour, .minute, .second], from: Date.now, to: endDate)
        
        if !hasCountdownCompleted,
           let hour = timeValue.hour,
           let minute = timeValue.minute,
           let second = timeValue.second {
            self.hour = hour
            self.minute = minute
            self.second = second
        }
    }
    
    func endTimer() {
        GameManager.shared.overlay = nil
        if (GameManager.shared.startedLevel){
            GameManager.shared.startedLevel = false
            GameManager.shared.StartLevel(skipAddDay: false)
        }
        
        
    }
    
    // Parse date from given string, identifying what format it matches.
    private func parseDate(_ dateString: String) -> Date {
        
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: dateString) else {
            return Date()
        }
        
        return date
    }
    
}

extension Date {
    var startOfNextDay: Date {
        return Calendar.current.nextDate(after: self, matching: DateComponents(hour: 0, minute: 0), matchingPolicy: .nextTimePreservingSmallerComponents)!
    }
    var millisecondsUntilTheNextDay: TimeInterval {
        return startOfNextDay.timeIntervalSince(self) * 1000
    }
}
