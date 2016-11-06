//
//  ViewController.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/5/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import Alamofire
import UIKit
import Freddy

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let test = Test()
        
        WebServices.shared.getObject(test) { (object, error) in
            if let object = object{
                print(object.description())
            } else {
                print (error ?? Constants.JSON.unknownError)
                
            }
        }
        //get many post
        let getPostsTest = Test()
        getPostsTest.requestType = .getPost
        
        WebServices.shared.getObjects(getPostsTest) { (objects, error) in
            if let objects = objects {
                print("got \(objects.count) items")
            }else {
                print("getpostfailed")
            }
        }
    }
    
}

//        print("making call")
//
//        request(WebServices.AuthRouter.restRequest(test)).response { (d) in
//            let request = d.request
//            let response = d.response
//            let data = d.data
//            let error = d.error
//
//            print("call returned")
//            if error != nil {
//                print("error: \(error)")
//            }
//            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
//
//            // Step 4: process response
//            var testReturn: Test?
//            var errorString: String?
//
//            let statusCode = response?.statusCode
//            if let statusCode = statusCode {
//                switch statusCode {
//                case 200:
//                    if let data = data {
//                        do {
//                            let json = try JSON(data: data)
//                            testReturn = try Test(json: json)
//                        } catch {}
//                    } else {
//                        errorString = Constants.JSON.unknownError
//                    }
//                case 400:
//                    errorString = Constants.JSON.unknownError
//                default:
//                    errorString = Constants.JSON.unknownError
//                }
//            }
//
//            if let testReturn = testReturn {
//                print("Title: \(testReturn.title!)")
//            } else {
//                print(errorString ?? Constants.JSON.unknownError)
//            }
//        }
//
//        //print("Request was sent")
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }



