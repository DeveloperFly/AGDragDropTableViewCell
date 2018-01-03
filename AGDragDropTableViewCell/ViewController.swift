//
//  ViewController.swift
//  AGDragDropTableViewCell
//
//  Created by Aman Gupta on 28/12/17.
//  Copyright © 2017 Developer Fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var bottomTableView: UITableView!
    @IBOutlet weak var topTableView: UITableView!
    
    //MARK: - Variables
    var arrayFirst = ["File1.jpeg", "File2.jpg", "File3.jpeg", "File4.jpg", "File5.jpeg", "File6.jpg", "File7.jpg", "File8.jpeg", "File9.jpeg", "File10.jpeg", "File11.jpg", "File12.jpg"  ]
    var arraySecond = ["File1.jpeg", "File2.jpg", "File3.jpeg", "File4.jpg"]
    var arrayFisrtProfileData = ProfileData().loadTopSampleData()
    var arraYsecondProfileData = [ProfileData]()
    
    //MARK: - View Lide Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topTableView.dragInteractionEnabled = true
        self.topTableView.dragDelegate = self
        self.bottomTableView.dropDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == topTableView {
            return arrayFisrtProfileData.count
        } else {
            return arraySecond.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == topTableView {
            let cell = topTableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath) as! TopTableViewCell
            cell.configureCell(profile: arrayFisrtProfileData[indexPath.row])
            return cell
        } else {
            let cell = bottomTableView.dequeueReusableCell(withIdentifier: "BottomTableViewCell", for: indexPath) as! BottomTableViewCell
            cell.imageViewProfile.image = UIImage(named: arraySecond[indexPath.row])
            return cell
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


extension ViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = self.dragItem(forPhotoAt: indexPath)
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        let dragItem = self.dragItem(forPhotoAt: indexPath)
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        return previewParameters(forItemAt:indexPath)
    }
    
    /// Helper method
    private func dragItem(forPhotoAt indexPath: IndexPath) -> UIDragItem {
        let imageName = self.arrayFirst[indexPath.row]
        let data = arrayFisrtProfileData[indexPath.row]
        let string = data.profileImageName
        let itemProvider = NSItemProvider(object: string as NSItemProviderWriting)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = imageName
        return dragItem
    }
    
    private func previewParameters(forItemAt indexPath:IndexPath) -> UIDragPreviewParameters? {
        let cell = self.topTableView.cellForRow(at: indexPath) as! TopTableViewCell
        let previewParameters = UIDragPreviewParameters()
        previewParameters.visiblePath = UIBezierPath(rect: cell.imageViewProfile.frame)
        return previewParameters
    }
    
}

extension ViewController: UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath

        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }

        coordinator.session.loadObjects(ofClass: NSString.self) { items in
            guard let string = items as? [String] else { return }

            var indexPaths = [IndexPath]()

            for (index, value) in string.enumerated() {
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                self.arraySecond.insert(value, at: indexPath.row)
                indexPaths.append(indexPath)
            }
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)

    }
    
    
    func tableView(_ tableView: UITableView, dropSessionDidEnter session: UIDropSession) {
        
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        return UITableViewDropProposal(operation: .copy, intent: .automatic)
    }
    

}

