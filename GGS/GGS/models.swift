//
//  models.swift
//  GGS
//
//  Created by Bill on 2/14/16.
//  Copyright © 2016 Bill Arons. All rights reserved.
//

import Foundation

class Scores {
    var course: String?
    var score: String?
    var date: String?
    
    init(json: NSDictionary) {
        self.course = json["course"] as? String
        self.score = json["score"] as? String
        self.date = json["date"] as? String
    }
}

/*
class Golfers {
    var FirstName: String?
    var LastName: String?
    var GolferID: String?
    
    init(json: NSDictionary) {
        self.FirstName = json["firstname"] as? String
        self.LastName = json["lastname"] as? String
        self.GolferID = json["golfer_id"] as? String
    }
}
*/

class Golfers {
    var GolferID: Int
    var FirstName: String
    var LastName: String
    
    init (GolferID: Int, FirstName: String, LastName: String) {
        self.GolferID = GolferID
        self.FirstName = FirstName
        self.LastName = LastName
    }
}