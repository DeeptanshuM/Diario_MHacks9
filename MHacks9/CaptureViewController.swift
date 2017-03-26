//
//  CaptureViewController.swift
//  MHacks9
//
//  Created by Kenan Dominic on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit
import CameraManager

class CaptureViewController: UIViewController {

    var image: UIImage?
    let cameraManager = CameraManager()

    @IBOutlet weak var cameraView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        cameraManager.addPreviewLayerToView(self.cameraView)
        cameraManager.cameraDevice = .back
        cameraManager.cameraOutputMode = .videoOnly
        cameraManager.cameraOutputQuality = .medium
        cameraManager.flashMode = .auto
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCapture(_ sender: Any) {
        self.cameraManager.capturePictureWithCompletion { (image: UIImage?, error: NSError?) in
            if let image = image {
                self.image = image
                GoogleCloudVisionAPI.getText(from: image)
                let date = parseText.getDate(input: GoogleCloudVisionAPI.recognizedText)
                print(date)
            }
            
        }
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
