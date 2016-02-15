//
//  Repository.swift
//  Table
//
//  Created by Bill on 2/10/16.
//  Copyright © 2016 BillCode. All rights reserved.
//

import UIKit

class Repository {
    var name: String?
    var description: String?
    var html_url: String?
    
    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.html_url = json["html_url"] as? String
    }
}

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

class Golfers {
    var firstName: String?
    var lastName: String?
    var golferID: String?
    
    init(json: NSDictionary) {
        self.firstName = json["firstname"] as? String
        self.lastName = json["lastname"] as? String
        self.golferID = json["golfer_id"] as? String
    }
}