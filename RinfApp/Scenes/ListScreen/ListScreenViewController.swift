//
//  ViewController.swift
//  RinfApp
//
//  Created by Radu Stefan on 07/12/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit


class ListScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var detailPlace: Place!
    
    private var viewModel: ListScreenViewModel!
    
    
    // MARK: - IBOutlet/IBAction
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewModel = ListScreenViewModel()
        
        viewModel.onFinishedDownloadingData = {
            self.tableView.reloadData()
        }
        
        viewModel.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listScreenTableViewCell", for: indexPath) as! ListScreenTableViewCell
        
        // Get place details
        let place = viewModel.resultList[indexPath.row]
        
        // Configure the cell
        cell.selectionStyle = .none
        cell.placeTitle.text = place.title
        cell.placeAddress.text = place.vicinity
        cell.placeCoordonates.text = "\(place.positionDetails[0]), \(place.positionDetails[1])"
        cell.placeIcon.af_setImage(withURL: URL(string: place.icon)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.resultList.count
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Cosntants.SegueId.listToDetail.rawValue {
            if let destVC = segue.destination as? DetailScreenViewController {
                if let cell = sender as? ListScreenTableViewCell {
                    let cellIndexPath = tableView.indexPath(for: cell)
                    destVC.placeDetails = viewModel.resultList[cellIndexPath!.row]
                }
            }
        }
    }
}

