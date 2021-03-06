//
//  models.swift
//  GGS
//
//  Created by Bill on 2/14/16.
//  Copyright © 2016 Bill Arons. All rights reserved.
//

import Foundation

class Score {
    var course: String?
    var score: String?
    var date: String?
    
    init(json: NSDictionary) {
        self.course = json["course"] as? String
        self.score = json["score"] as? String
        self.date = json["date"] as? String
    }
}

// complex object that will be loaded manually
/*
class Golfer {
    var GolferID: Int
    var FirstName: String
    var LastName: String
    
    init (GolferID: Int, FirstName: String, LastName: String) {
        self.GolferID = GolferID
        self.FirstName = FirstName
        self.LastName = LastName
    }
}
*/

// complex object that will be loaded via json
class Golfer {
    var FirstName: String?
    var LastName: String?
    var GolferID: String?

    init(json: NSDictionary) {
        self.FirstName = json["firstname"] as? String
        self.LastName = json["lastname"] as? String
        self.GolferID = json["golfer_id"] as? String
    }
}

// complex object that will be loaded manually
class MainMenu {
    var OptionID: Int
    var OptionName: String
    var LeagueID: Int
    
    init (OptionID: Int, OptionName: String, LeagueID: Int) {
        self.OptionID = OptionID
        self.OptionName = OptionName
        self.LeagueID = LeagueID
    }
}

// complex object that will be loaded manually
class GolferMenu {
    var OptionID: Int
    var OptionName: String

    init (OptionID: Int, OptionName: String) {
        self.OptionID = OptionID
        self.OptionName = OptionName
    }
}