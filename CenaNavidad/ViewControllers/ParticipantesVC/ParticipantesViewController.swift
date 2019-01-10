//
//  ParticipantesViewController.swift
//  CenaNavidad
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 9/1/19.
//  Copyright © 2019 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit

class ParticipantesViewController: UIViewController {
    internal var participantes: [Participantes] = []
    @IBOutlet weak var PeopleTable: UITableView!
    internal var repository = LocalPeopleRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        participantes = repository.getAll()
        title = "PERSONAS"
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPressed))
        navigationItem.setRightBarButton(addBarButtonItem, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc internal func addPressed()
    {
        let addView = AddViewController(task: nil)
         addView.delegate = self as! AddViewControllerDelegate
        addView.modalTransitionStyle = .coverVertical
        addView.modalPresentationStyle = .overCurrentContext
        present(addView,animated: true,completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func registerCell()
    {
        let indentifier = "PeopleTableViewCell"
        let nib = UINib(nibName: indentifier, bundle: nil)
        PeopleTable?.register(nib, forCellReuseIdentifier: "PeopleTableViewCell")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ParticipantesViewController: UITableViewDelegate,UITableViewDataSource
    
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantes.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 88.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PeopleTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath) as? PeopleTableViewCell)!
        let person = participantes[indexPath.row]
        cell.lblname.text = person.name
        return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
extension ParticipantesViewController: AddViewControllerDelegate
{
    func addViewController(_vc: AddViewController, didEditTask task: Participantes) {
        _vc.dismiss(animated: true, completion: nil)
        if repository.create(a: task) {
            participantes = repository.getAll()
            PeopleTable?.reloadData()
        }
    }
}
