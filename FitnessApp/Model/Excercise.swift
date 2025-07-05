//
//  Excercise.swift
//  FitnessApp
//
//  Created by Purnasindhu-749 on 05/07/25.
//

import Foundation
struct Excercise{
    let name : String
    let animation : String
    let duration : Int
}
extension Excercise{
    static let mockJumpingJackExcercise = Excercise(name: "Jumping Jack", animation: "jumpingjack", duration: 10)
    static let mockPushupExcercise = Excercise(name: "Push Ups", animation: "pushups", duration: 15)

}
