//
//  Program.swift
//  FitnessApp
//
//  Created by Purnasindhu-749 on 05/07/25.
//

import Foundation
struct Program{
    let title : String
    let image : String
    let calories : Int
    let duration : Int
    let excercise : [Excercise]
}

extension Program{
    static let beginnerMockPorgram = Program(title: "Beginner", image: "man-lunge", calories: 100, duration: 1, excercise: [
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise,
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise
    ])
    
    static let intermediateMockPorgram = Program(title: "Intermediate", image: "lady-stretch", calories: 200, duration: 2, excercise: [
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise,
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise
    ])
    
    static let advancedMockPorgram = Program(title: "Advanced", image: "lady-jump", calories: 300, duration: 3, excercise: [
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise,
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise,
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise

    ])
}
