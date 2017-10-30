//
//  ElementeTableViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 30.10.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit

class ElementeTableViewController: UITableViewController, UIViewControllerPreviewingDelegate {
    
    let data = ["Wasserstoff","Sauerstoff","Kohlenstoff","Stickstoff"]
    let data2 = ["Mol : 1", "Mol: ka", "Mol: ka2", "Mol: 14glaubs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Peek and Pop registrieren
        registerForPreviewing(with: self, sourceView: tableView)
    }
    
    //Protokoll methoden
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = tableView.indexPathForRow(at: location) else {
            return nil
        }
        
        let detailViewController = createDetailViewControllerIndexPath(indexPath: indexPath)
        
        return detailViewController
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    //TableView Methoden
    override func numberOfSections(in tableView: UITableView) -> Int {return 1}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return data.count}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailViewController = createDetailViewControllerIndexPath(indexPath: indexPath)
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    private func createDetailViewControllerIndexPath(indexPath: IndexPath) -> DetailViewController {
        
        let text = data[indexPath.row]
        let text2 = data2[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = sb.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailViewController.userText = text
        detailViewController.elementInfo = text2
        return detailViewController
    }
    
}
