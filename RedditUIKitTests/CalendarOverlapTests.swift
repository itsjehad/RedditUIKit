//
//  CalendarOverlapTests.swift
//  RedditUIKitTests
//
//  Created by Jehad Sarkar on 2019-09-27.
//  Copyright © 2019 itsjehad. All rights reserved.
//

import XCTest

struct Event {
    let id: Int
    let desc: String
    var startTime: Date
    var endTime: Date
    init(_ id: Int, _ desc: String, _ startTime: Date, _ endTime: Date){
        self.id = id
        self.desc = desc
        self.startTime = startTime
        self.endTime = endTime
    }
    func isOverlapping(_ event: Event) -> Bool{
        return (self.startTime...self.endTime).overlaps(event.startTime...event.endTime)
    }
    
}

//MARK: These are not used...
extension Event: Equatable{
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Event: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}

//MARK: CalendarOverlap
class CalendarOverlapTests: XCTestCase {
    
    //O(n log n) solution
    func getOverlappedPairs(_ events: [Event]) -> [Event] {
        var overlappingEvents:[Event] = []
        if(events.count > 0){
            let sortedEvents = events.sorted(by: { $0.startTime < $1.startTime }) //O(nlog(n))
            var overlappedIndexes:[Bool] = Array(repeating: false, count: sortedEvents.count)
            var anEvent = sortedEvents[0];
            var prvIndex = 0
            for index in 1..<sortedEvents.count{ //O(n)
                if(anEvent.isOverlapping(sortedEvents[index])){
                    overlappedIndexes[prvIndex] = true
                    overlappedIndexes[index] = true
                    if(anEvent.endTime < sortedEvents[index].endTime){
                        prvIndex = index;
                        anEvent = sortedEvents[index]
                    }
                    else{
                        anEvent.startTime = sortedEvents[index].startTime
                    }
                }
                else{
                    prvIndex = index;
                    anEvent = sortedEvents[index]
                }
            }
            for index in 0..<overlappedIndexes.count{ //O(n)
                if overlappedIndexes[index] == true {
                    overlappingEvents.append(sortedEvents[index])
                }
            }
        }
        return overlappingEvents
    }

//MARK: Test cases.
    func testEmptyEvents(){
        let events = [Event]()
        let overlappingEvents = getOverlappedPairs(events)
        XCTAssertEqual(events, overlappingEvents)
    }
    func testEdgeNoOverlaps(){
        var events = [Event]()
        let date = Date()
        events.append(Event(1, "test1", date, date+1))
        events.append(Event(2, "test2", date+1.01, date+2))
        events.append(Event(3, "test3", date+2.01, date+3))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual([], overlappingEvents)
    }
    func testEdgeOverlaps(){
        var events = [Event]()
        let date = Date()
        events.append(Event(1, "test1", date, date+1))
        events.append(Event(2, "test2", date+1, date+2))
        events.append(Event(3, "test3", date+2, date+3))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual(events.sorted(by: { $0.startTime < $1.startTime }), overlappingEvents)
    }
    func testPartialOverlap() {
        var events = [Event]()
        let date = Date()
        events.append(Event(1, "test1", date-2, date+10))
        events.append(Event(2, "test2", date-1, date+1))
        events.append(Event(3, "test3", date-2, date+2))
        events.append(Event(4, "test3", date+11, date+12))
        events.append(Event(5, "test3", date+12.01, date+12.5))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual(events[0...2].sorted(by: { $0.startTime < $1.startTime }), overlappingEvents)
    }
    
    func testNonSequentialPartialOverlap() {
        var events = [Event]()
        let date = Date()
        events.append(Event(1, "test1", date, date+60))
        events.append(Event(2, "test2", date+61, date+2*60))
        events.append(Event(3, "test3", date, date+30))
        events.append(Event(4, "test2", date+60+30, date+3*60))
        events.append(Event(4, "test2", date+3*60+1, date+4*60))
        
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        let testEvents = [events[0], events[2], events[1], events[3]]
        XCTAssertEqual(testEvents, overlappingEvents)
    }

    func testAllOverlap() {
        let date = Date()
        var events = [Event]()
        events.append(Event(1, "test1", date-2, date+10))
        events.append(Event(2, "test2", date-1, date+1))
        events.append(Event(3, "test3", date-2, date+2))
        events.append(Event(4, "test3", date+11, date+12))
        events.append(Event(5, "test3", date+11, date+11.5))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual(events.sorted(by: { $0.startTime < $1.startTime }), overlappingEvents)
    }
    
    func testNoOverlap() {
        let date = Date()
        var events = [Event]()
        events.append(Event(1, "test1", date, date+1))
        events.append(Event(2, "test2", date+1.1, date+2))
        events.append(Event(3, "test3", date+2.01, date+3))
        events.append(Event(4, "test3", date+3.01, date+4))
        events.append(Event(5, "test3", date+11, date+11.5))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual([], overlappingEvents)
    }

}
