//
//  ViewController.swift
//  FitnessApp

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let programs :[Program] = [
        Program.beginnerMockPorgram,
        Program.intermediateMockPorgram,
        Program.advancedMockPorgram
    ]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WorkoutSegue"{
            let destinationVc  = segue.destination as! WorkoutViewController
            let program = sender as! Program
            destinationVc.program = program
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProgramTableViewCell", bundle: nil), forCellReuseIdentifier: ProgramTableViewCell.identifier)
        tableView.separatorStyle = .none
    }


}

extension DashboardViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProgramTableViewCell.identifier, for: indexPath) as! ProgramTableViewCell
        let program = programs[indexPath.row]
        cell.configure(withProgram: program)
        return cell
    }
    
    
}

extension DashboardViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let program = programs[indexPath.row]
        performSegue(withIdentifier: "WorkoutSegue", sender: program)
    }
}
