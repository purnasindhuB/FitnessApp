//
//  WorkoutViewController.swift
//  FitnessApp
//
//  Created by Purnasindhu-749 on 05/07/25.
//

import UIKit
import Lottie

protocol WorkoutDelegate: AnyObject {
    func dismissWorkout()
}

class WorkoutViewController: UIViewController {
    @IBOutlet weak var ringView: RingView!
    @IBOutlet weak var animationView: LottieAnimationView!
    
    var program : Program!
    var currentExcerciseIndex = 0
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WorkoutResultsSegue"{
            let destinationVC = segue.destination as! WorkoutResultsViewController
            destinationVC.workoutDelegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ringView.delegate = self
        ringView.progress = 0.0
        
        // Do any additional setup after loading the view.
    }
    
    func loadExcercise() {
        let excercise = program.excercise[currentExcerciseIndex]
        animationView.animation = LottieAnimation.named(excercise.animation)
        ringView.startAnimation(time: excercise.duration)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadExcercise()
    }
    
}
extension WorkoutViewController:RingViewDelegate {
    func animationDidEnd() {
        if program.excercise.count - 1 == currentExcerciseIndex{
            animationView.stop()
            performSegue(withIdentifier: "WorkoutResultsSegue", sender: nil)
            return
        }
        currentExcerciseIndex += 1
        loadExcercise()
    }
}
extension WorkoutViewController: WorkoutDelegate {
    func dismissWorkout() {
        dismiss(animated: true)
    }
    
    
}
