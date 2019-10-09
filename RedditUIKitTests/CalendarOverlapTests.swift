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

//MARK: These are used only for test cases...
extension Event: Equatable{
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id && lhs.startTime == rhs.startTime && lhs.endTime==rhs.endTime
    }
}

extension Event: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
        hasher.combine(startTime.hashValue)
        hasher.combine(endTime.hashValue)
    }
}

//When maintaining a calendar of events, it is important to know if an event overlaps with another event. Given a sequence of events, each having a start and end time, write a program that will return the sequence of all pairs of overlapping events.

//MARK: Return Overlapped Event paris for the given Events. Time Complexity O(n log n), space complexity O(n)
//Algorithm:
//1. Sort the events in ascending order. O(n log n)
//2. Find the overlapping pairs sequentially, if overlapped mark the indexes. O(n)
//3. Return the events with marked indexes
//Time complexity O(n log n). Space complexity O(n)
func getOverlappedPairs(_ events: [Event]) -> [Event] {
    var overlappingEvents:[Event] = []
    if(events.count > 0){
        
        let sortedEvents = events.sorted(by: { $0.startTime < $1.startTime }) //Sort the event O(n log n))
        print(events)
        print(sortedEvents)
        var overlappedIndexes:[Bool] = Array(repeating: false, count: sortedEvents.count) //Boolean Array to mark the overlappepd pair of indexes.
        var prvEvent = sortedEvents[0];
        var prvIndex = 0
        //Find the overlapped events
        for index in 1..<sortedEvents.count{ //O(n)
            if(prvEvent.isOverlapping(sortedEvents[index])){
                //Two events overlapped...mark the events
                overlappedIndexes[prvIndex] = true
                overlappedIndexes[index] = true
                //move to the next event if it's endtime is after the previous event
                if(prvEvent.endTime < sortedEvents[index].endTime){
                    prvIndex = index;
                    prvEvent = sortedEvents[index]
                }
            }
            else{
                //No overlapping... move to the next event
                prvIndex = index;
                prvEvent = sortedEvents[index]
            }
        }
        
        //Copy the marked (overlapped) events to the result
        for index in 0..<overlappedIndexes.count{ //O(n)
            if overlappedIndexes[index] == true {
                overlappingEvents.append(sortedEvents[index])
            }
        }
    }
    return overlappingEvents
}

//MARK: CalendarOverlapTests
class CalendarOverlapTests: XCTestCase {

//MARK: Test cases.
    func testEmptyEvents(){
        let events = [Event]()
        let overlappingEvents = getOverlappedPairs(events)
        XCTAssertEqual(events, overlappingEvents)
    }
    
    func testOneEvent(){
        var events = [Event]()
        let date = Date()
        events.append(Event(1, "test1", date, date+60*60)) //one hour
        let overlappingEvents = getOverlappedPairs(events)
        XCTAssertEqual([], overlappingEvents)
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
