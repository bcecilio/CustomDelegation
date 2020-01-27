//
//  Movies.swift
//  CustomDelegation
//
//  Created by Brendon Cecilio on 1/27/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import Foundation

class Movies {
    var name: String
    var releaseDate: String
    
    init(name: String, releaseDate: String) {
        self.name = name
        self.releaseDate = releaseDate
    }
    
    static let allMovies = [
        Movies(name: "In the Mood for Love", releaseDate: "2000"),
        Movies(name: "Chungking Express", releaseDate: "1994"),
        Movies(name: "As Tears Go By", releaseDate: "1988"),
        Movies(name: "Happy Together", releaseDate: "1997"),
        Movies(name: "2046", releaseDate: "2004"),
        Movies(name: "Days of Being Wild", releaseDate: "1990"),
        Movies(name: "Fallen Angels", releaseDate: "1995")
    ]
}
