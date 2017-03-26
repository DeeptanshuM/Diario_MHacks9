//
//  GoogleCloudVisionAPI.swift
//  MHacks9
//
//  Created by Ryuji Mano on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import UIKit
import SwiftyJSON

class GoogleCloudVisionAPI: NSObject {

    static let apiKey = ""
    let googleURL = "https://vision.googleapis.com/v1/images:annotate?key=\(apiKey)"
    let session = URLSession.shared
    
    static var recognizedText = ""
    
    func getText(from image: UIImage) {
        var data = UIImagePNGRepresentation(image)
        
        // Resize the image if it exceeds the 2MB API limit
        if ((data?.count)! > 2097152) {
            let old: CGSize = image.size
            let new: CGSize = CGSize(width: 800, height: old.height / old.width * 800)
            data = resizeImage(new, image: image)
        }
        
        getText(with: data!.base64EncodedString(options: .endLineWithCarriageReturn))
    }
    
    func resizeImage(_ imageSize: CGSize, image: UIImage) -> Data {
        UIGraphicsBeginImageContext(imageSize)
        image.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        let resizedImage = UIImagePNGRepresentation(newImage!)
        UIGraphicsEndImageContext()
        return resizedImage!
    }
    
    func getText(with data: String) {
        var request = URLRequest(url: URL(string: googleURL)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Build our API request
        let jsonRequest = [
            "requests": [
                "image": [
                    "content": data
                ],
                "features": [
                    [
                        "type": "TEXT_DETECTION",
                        "maxResults": 10
                    ]
                ]
            ]
        ]
        let jsonObject = JSON(jsonDictionary: jsonRequest)
        
        // Serialize the JSON
        guard let data = try? jsonObject.rawData() else {
            return
        }
        
        request.httpBody = data
        
        // Run the request on a background thread
        let semaphore = DispatchSemaphore(value: 0)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            let json = JSON(data)
            GoogleCloudVisionAPI.recognizedText = json["response"][0]["fullTextAnnotation"]["text"].string!
            
            semaphore.signal()
        }
        
        task.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
    
    }
    
    func getDate() {
        
    }
}
