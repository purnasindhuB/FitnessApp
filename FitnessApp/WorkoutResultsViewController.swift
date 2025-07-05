//
//  WorkoutResultsViewController.swift
//  FitnessApp
//
//  Created by Purnasindhu-749 on 05/07/25.
//

import UIKit
import Lottie

class WorkoutResultsViewController: UIViewController {
    
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var submitButton: ShadowButton!
    @IBOutlet weak var trophyAnimationView: LottieAnimationView!
    
    weak var workoutDelegate : WorkoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congratulationsLabel.font = UIFont.style(.title)
        submitButton.setTitle("Submit", for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    func dismissWorkout() {
        dismiss(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultsView.layer.cornerRadius = 6
    }
    
    func startAnimation() {
        trophyAnimationView.animation = LottieAnimation.named("trophy")
        trophyAnimationView.loopMode = .loop
        trophyAnimationView.contentMode = .scaleAspectFit
        trophyAnimationView.play()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        dismiss(animated: true) {
            self.workoutDelegate?.dismissWorkout()
        }
    }
    
    
    
}
