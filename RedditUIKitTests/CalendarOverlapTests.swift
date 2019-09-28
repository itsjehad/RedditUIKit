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

class CalendarOverlapTests: XCTestCase {

    func getOverlappedPairs(_ events: [Event]) -> [Event] {
        let sortedEvents = events.sorted(by: { $0.startTime < $1.startTime }) //O(nlog(n))
        var overlappedIndexes:[Bool] = Array(repeating: false, count: sortedEvents.count)
        for event in sortedEvents{
            print(event)
        }
        print("\n\n")
        
        var overlappingEvents:[Event] = []
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
        return overlappingEvents
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
        events.append(Event(1, "test1", Date()-2, Date()+10))
        events.append(Event(2, "test2", Date()-1, Date()+1))
        events.append(Event(3, "test3", Date()-2, Date()+2))
        events.append(Event(4, "test3", Date()+11, Date()+12))
        events.append(Event(5, "test3", Date()+12.01, Date()+12.5))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual(events[0...2].sorted(by: { $0.startTime < $1.startTime }), overlappingEvents)
    }

    func testAllOverlap() {
        var events = [Event]()
        events.append(Event(1, "test1", Date()-2, Date()+10))
        events.append(Event(2, "test2", Date()-1, Date()+1))
        events.append(Event(3, "test3", Date()-2, Date()+2))
        events.append(Event(4, "test3", Date()+11, Date()+12))
        events.append(Event(5, "test3", Date()+11, Date()+11.5))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual(events.sorted(by: { $0.startTime < $1.startTime }), overlappingEvents)
    }
    
    func testNoOverlap() {
        var events = [Event]()
        events.append(Event(1, "test1", Date(), Date()+1))
        events.append(Event(2, "test2", Date()+1.1, Date()+2))
        events.append(Event(3, "test3", Date()+2.01, Date()+3))
        events.append(Event(4, "test3", Date()+3.01, Date()+4))
        events.append(Event(5, "test3", Date()+11, Date()+11.5))
        let overlappingEvents = getOverlappedPairs(events)
        for event in overlappingEvents{
            print(event)
        }
        XCTAssertEqual([], overlappingEvents)
    }

}