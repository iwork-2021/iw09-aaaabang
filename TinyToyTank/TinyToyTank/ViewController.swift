//
//  ViewController.swift
//  TinyToyTank
//
//  Created by nju on 2022/1/7.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var tankAnchor: TinyToyTank._TinyToyTank?
    var isActionPlaying: Bool = false

    override func viewDidLoad() {
        // 1
        super.viewDidLoad()
        // 2
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        // 3
        tankAnchor!.turret?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        arView.scene.anchors.append(tankAnchor!)
        
    
        tankAnchor?.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }

    }
    @IBAction func turnLeft(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.turretLeft.post()
    }
    
    @IBAction func cannonFire(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.cannonFire.post()
        
    }
    
    @IBAction func turnRight(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.turretRight.post()

    }
    
    @IBAction func tankLeft(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.tankLeft.post()
    }
    
    @IBAction func tankForward(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.tankForward.post()
    }
    
    @IBAction func tankRight(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }

        tankAnchor!.notifications.tankRight.post()
    }
    
}
